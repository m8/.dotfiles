syntax on

set number
set mouse=a
set showcmd
set wildmenu
set ruler

set autoindent expandtab tabstop=4 shiftwidth=4

" remap the d to delete not copy
" nnoremap d "_d
" vnoremap d "_d

" share host's clipboard
set clipboard=unnamedplus

highlight Comment ctermfg=green

call plug#begin('~/.vim/plugged')

" Add fzf and fzf.vim plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

