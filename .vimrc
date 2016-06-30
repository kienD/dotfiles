"""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Configs
"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugins
call plug#begin('~/.vim/plugged')

" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'vim-dichromatic'
Plug 'whatyouhide/vim-gotham'

" Plugs
Plug 'airblade/vim-gitgutter'
Plug 'mthadley/syntastic-csf'
Plug 'scrooloose/syntastic'
Plug 'alvan/vim-closetag'

" Syntax Files
Plug 'cakebaker/scss-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme dichromatic
"set background=dark
set number
set relativenumber
set shiftwidth=2
set tabstop=2
"syntax enable
"set syntax=whitespace
set guifont=Monospace\ 16
set so=999
