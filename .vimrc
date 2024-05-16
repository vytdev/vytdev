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
set expandtab
set colorcolumn=100
hi ColorColumn ctermbg=lightgrey guibg=lightgrey

let g:netrw_banner = 0
let g:netrw_liststyle = 4

" thin cursor on insert-mode
let &t_SI = "\<Esc>[6 q"
let &t_EI = "\<Esc>[ q"

" vim-plug configuration
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sickill/vim-monokai'
Plug 'lambdalisue/vim-glyph-palette'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
call plug#end()

" i prefer ctrl+n for alias of NERDTreeToggle
nnoremap <C-n> :NERDTreeToggle<CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-R>=coc#refresh()\<CR>\<C-Space>"

" editor theme
colorscheme monokai

" set colors for coc.nvim
highlight CocErrorSign ctermbg=NONE ctermfg=red guibg=NONE guifg=red
highlight CocWarningSign ctermbg=NONE ctermfg=yellow guibg=NONE guifg=yellow
highlight CocInfoSign ctermbg=NONE ctermfg=green guibg=NONE guifg=green
highlight CocHintSign ctermbg=NONE ctermfg=cyan guibg=NONE guifg=cyan

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" auto-pairs
let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"', '`':'`'}

