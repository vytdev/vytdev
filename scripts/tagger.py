import sys
import os
import re
import eyed3
import musicbrainzngs as mb
import requests
from eyed3.id3 import ID3_V2_4

# Setup MusicBrainz
mb.set_useragent("OldSchoolTagger", "1.0", "your@email.com")

def clean_title(title):
    return re.sub(r"\s*\(.*?\)", "", title).strip()

def to_latin1_safe(text):
    if not text:
        return text
    return text.encode("latin-1", errors="ignore").decode("latin-1")

def fetch_lyrics(artist, title):
    try:
        url = f"https://api.lyrics.ovh/v1/{artist}/{title}"
        response = requests.get(url)
        if response.status_code == 200:
            data = response.json()
            return data.get("lyrics", "").strip()
    except Exception as e:
        print(f"[!] Lyrics fetch failed: {e}")
    return None

def tag_file(mp3_path):
    audio = eyed3.load(mp3_path)
    if audio is None:
        print(f"[!] Cannot read: {mp3_path}")
        return

    if audio.tag is None:
        audio.initTag(version=ID3_V2_4)
    else:
        audio.tag.version = ID3_V2_4

    title = audio.tag.title
    artist = audio.tag.artist

    if not title or not artist:
        print(f"[!] Missing title/artist in tag: {mp3_path}")
        return

    print(f"🎧 Tagging: {title} - {artist}")
    try:
        result = mb.search_recordings(recording=title, artist=artist, limit=1)
        recordings = result.get("recording-list", [])
        if not recordings:
            print(f"[!] No match found for: {title}")
            return

        rec = recordings[0]
        rel = rec.get("release-list", [{}])[0]

        # Core tags (do NOT overwrite title or artist)
        audio.tag.album = to_latin1_safe(rel.get("title"))
        audio.tag.album_artist = to_latin1_safe(rel.get("artist-credit", [{}])[0].get("artist", {}).get("name", artist))

        date = rel.get("date", "")
        if date:
            year = date[:4]
            audio.tag.recording_date = to_latin1_safe(year)
            audio.tag.original_release_date = to_latin1_safe(year)

        # Track/disc numbers
        medium = rel.get("medium-list", [{}])[0]
        track_info = medium.get("track-list", [{}])[0]
        if track_info.get("number"):
            try:
                audio.tag.track_num = int(track_info["number"])
            except ValueError:
                pass
        if medium.get("position"):
            try:
                audio.tag.disc_num = int(medium["position"])
            except ValueError:
                pass

        # Composer / Lyricist
        relations = rec.get("artist-relation-list", [])
        for rel_obj in relations:
            role = rel_obj.get("type", "").lower()
            name = to_latin1_safe(rel_obj.get("artist", {}).get("name", ""))
            if "composer" in role and not audio.tag.composer:
                audio.tag.composer = name
            if "lyricist" in role and not audio.tag.lyrics:
                lyrics_obj = audio.tag.lyrics.set("")
                lyrics_obj.description = "Lyricist"
                lyrics_obj.text = name

        # Genre
        tags = rec.get("tag-list", [])
        if tags:
            genres = [to_latin1_safe(t["name"]) for t in tags[:2]]
            audio.tag.genre = ", ".join(genres)

        # Publisher / Copyright
        label_info = rel.get("label-info-list", [{}])[0]
        label = label_info.get("label", {}).get("name")
        if label:
            safe_label = to_latin1_safe(label)
            audio.tag.publisher = safe_label
            audio.tag.copyright = f"℗ {safe_label}"

        # Cover Art
        try:
            image_data = mb.get_image_front(rel["id"])
            audio.tag.images.set(3, image_data, "image/jpeg", u"cover")
        except:
            pass

        # Lyrics (real lyrics)
        lyrics = fetch_lyrics(artist, title)
        if lyrics:
            lyrics_obj = audio.tag.lyrics.set("")
            lyrics_obj.description = "Lyrics"
            lyrics_obj.text = to_latin1_safe(lyrics)

        audio.tag.save(version=ID3_V2_4)
        print(f"[✔] Tagged: {mp3_path}")

    except Exception as e:
        print(f"[!] Error while tagging {mp3_path}: {e}")

# --- Entry Point ---
if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python3 autotag.py file1.mp3 [file2.mp3 ...]")
        sys.exit(1)

    for path in sys.argv[1:]:
        if path.lower().endswith(".mp3") and os.path.isfile(path):
            tag_file(path)
        else:
            print(f"[!] Skipped (not an mp3 file): {path}")
