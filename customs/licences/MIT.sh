printf "Please enter your fullname: "
read fullname
printf "Please enter the year: "
read year
load_template MIT-template.txt |        \
substitute '[fullname]' "$fullname" |   \
substitute '[year]' "$year" |           \
save_file "LICENSE"
