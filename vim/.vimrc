"""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Configs
"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""
" VimPlug
"""""""""""""""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

" Plugins
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'amadeus/vim-mjml'
Plug 'christoomey/vim-sort-motion'
Plug 'neoclide/coc.nvim', {'branch': 'release' }
Plug 'google/vim-searchindex'
Plug 'hashivim/vim-terraform'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-plug'
Plug 'junegunn/fzf'
Plug 'prettier/vim-prettier'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'dense-analysis/ale'
Plug 'Yggdroot/indentline'
" Plug 'python-mode/python-mode', { 'branch': 'develop' }
" Plug 'Valloric/YouCompleteMe'

" Syntax Files
Plug 'cakebaker/scss-syntax.vim'
Plug 'elzr/vim-json'
Plug 'jparise/vim-graphql'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'rudes/vim-java'
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'ianks/vim-tsx'
" Plug 'mxw/vim-jsx'
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'yuezk/vim-js'

" Themes
Plug 'lucasprag/simpleblack'

call plug#end()

" COC Extensions
" coc-tserver
" coc-prettier
" coc-json
" coc-html
" coc-eslint
" coc-sh
" coc-css
" coc-react-refactor

"""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

set background=dark
set dir=/tmp
set encoding=utf-8
set expandtab
set guifont=Source\ Code\ Pro\ 12
set hidden " For CoC
set hlsearch
set ignorecase
set laststatus=2
set lazyredraw
set mouse=a
set nobackup
set nocursorline
set number
set relativenumber
set shiftwidth=2
set splitbelow
set splitright
set sts=2
set tabstop=2
set term=xterm-256color
" set term=rxvt-unicode-256color
" set term=rxvt-unicde
set termguicolors
set ttymouse=sgr
set t_Co=256

" For Coc
set shortmess+=c
set updatetime=300

colorscheme simpleblack

hi LineNr guifg=Grey
hi Search gui=NONE
hi Search guibg=Yellow
hi Search guifg=Black

" Set clipboard as shared between X session and Vim
set clipboard=unnamed,unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Closetag
let g:closetag_filenames = "*.html,*.xhtml,*.js,*.jsp,*.jsx,*.ts,*.tsx,*.xml"
let g:closetag_regions = {
      \ 'typescript.tsx': 'jsxRegion,tsxRegion',
      \ 'javascript.jsx': 'jsxRegion',
      \ 'typescriptreact': 'jsxRegion,tsxRegion',
      \ 'javascriptreact': 'jsxRegion',
      \ }

" CoC (Conquer of Completion)
let g:coc_global_extensions = [ 'coc-tsserver' ]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" React refactor plugin
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" function! ShowDocIfNoDiagnostic(timer_id)
"   if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
"     silent call CocActionAsync('doHover')
"   endif
" endfunction

" function! s:show_hover_doc()
"   call timer_start(500, 'ShowDocIfNoDiagnostic')
" endfunction

" autocmd CursorHoldI * :call <SID>show_hover_doc()
" autocmd CursorHold * :call <SID>show_hover_doc()

" Set coc-css for scss files
autocmd FileType scss setl iskeyword+=@-@

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Perform code action
nmap <leader>do <Plug>(coc-codeaction)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

nnoremap <silent> K :call CocAction('doHover')<CR>

" Go to next error
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" fzf
let g:fzf_layout = { 'down': '~20%' }
map <C-P> :FZF<CR>

" Indent Line
let g:indentLine_char = '•'
let g:indentLine_concealcursor = "c"
let g:jsx_ext_required = 0

" NerdTree
let NERDTreeShowHidden = 1
map <C-\> :NERDTreeToggle<CR>

" Prettier
let g:prettier#autoformat = 0

" Python Mode
let g:pymode_python = 'python3'

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0

" Vim Sort Motion
let g:sort_motion_flags = "ui"

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""
" See files changed before saving
function! DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" Key Bindings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap j jzz
nnoremap k kzz
nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>

au StdinReadPre * let s:std_in=1

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Autoreload file on change
set autoread
au WinEnter * checktime

" Remove trailing whitespaces
au BufWritePre * :%s/\s\+$//e

" Force Syntax highlighting for certain  file ext
au BufRead,BufNewFile *.tsx,*.jsx set filetype=typescriptreact
au BufRead,BufNewFile *.jspf,*.tag set filetype=jsp
au BufRead,BufNewFile .babelrc set filetype=json

" Work settings for trailing newlines
au BufRead,BufNewFile */Liferay/* setlocal sw=2 sts=2 ts=2 noet
au BufRead,BufNewFile */Liferay/*.properties,*/Liferay/*.scss,*/Liferay/*.java,*/Liferay/*.jsp,*/Liferay/*.jspa setlocal noeol nofixeol

" Set syntax to html for snapshots
au BufReadPost *.snap set syntax=jsx

" Prettier auto-format before saving async
" au BufWritePre *.scss,*.css,*.js,*.jsx,*.mjs,*.ts,*.tsx,*.less,*.graphql,*.md,*.vue PrettierAsync

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Macros
"""""""""""""""""""""""""""""""""""""""""""""""""""
runtime macros/matchit.vim

" Wrap selected item in console.log
let @c='S)iconsole.log'

" Break a 3 attribute single-line tag into a multi-line tag
let @n='f xif xif xif>i'

" Break text after space into new line
let @l='f xi'

" Trim js ext off imports & add ;
let @i = 'vbbxa;'

" Convert method to arrow function
let @f='iconst ^C^Cf(i = ^C^Cf)a =>^C^C'
