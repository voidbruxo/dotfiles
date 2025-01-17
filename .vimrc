" line numbers
set number

" syntax highlighting isn't bloat
syntax on
" enable mouse
set mouse=a
set ttymouse=sgr
set relativenumber
set tabstop=4
set expandtab
set cursorline
filetype plugin indent on
set nocompatible
syntax enable

au BufNewFile,BufRead /*.rasi setf css

call plug#begin('~/.vim/plugged')
  Plug 'vimwiki/vimwiki'
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  Plug 'preservim/nerdtree'
  Plug 'powerline/fonts'
  Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
  Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()


" vimwiki defaults to markdown
let g:vimwiki_list = [{'path': '~/Notes/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" nerdtree keybindings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" vimairline fonts
let g:airline_powerline_fonts = 1
colorscheme dracula
