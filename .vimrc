" vytdev's .vimrc file
"
" requires vim-plug:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" :PlugInstall
" :qa!
" $ vim


" generic config
set number
set numberwidth=4
set shiftwidth=2
set colorcolumn=80
set expandtab
hi ColorColumn ctermbg=lightgrey guibg=lightgrey
set background=dark

syntax on
filetype plugin indent on
set incsearch
set hlsearch

inoremap <silent><expr> <Tab> pumvisible() ? coc#pum#confirm() : "\<Tab>"

" thin cursor on insert-mode
let &t_SI = "\<Esc>[6 q"
let &t_EI = "\<Esc>[ q"

" vim-plug configuration
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lambdalisue/vim-glyph-palette'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tomasiser/vim-code-dark'
Plug 'phanviet/vim-monokai-pro'
Plug 'Glench/Vim-Jinja2-Syntax'
call plug#end()

" i prefer ctrl+n for alias of NERDTreeToggle
nnoremap <C-n> :NERDTreeToggle<CR>

" set colors for coc.nvim
hi CocErrorSign   ctermfg=red    guifg=red
hi CocWarningSign ctermfg=yellow guifg=yellow
hi CocInfoSign    ctermfg=green  guifg=green
hi CocHintSign    ctermfg=cyan   guifg=cyan

" nerdtree
let g:netrw_banner = 0
let g:netrw_liststyle = 4

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" auto-pairs
let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"', '`':'`'}

" vscode dark theme
"let g:codedark_italics = 1
"colorscheme codedark

set termguicolors
colorscheme monokai_pro
