syntax on
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin 'monkoose/boa.vim'
Plugin 'morhetz/gruvbox'

" JavaScript
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
" Plugin 'mxw/vim-jsx'
Plugin 'neoclide/vim-jsx-improve'

" Automation
Plugin 'airblade/vim-gitgutter'
" Plugin 'ajh17/VimCompletesMe'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/neocomplete.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'avdeveloper/birds-of-paradise.vim'
" Plugin 'guns/xterm-color-table.vim'
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" colorscheme birds-of-paradise
" colorscheme gruvbox
colorscheme birds-of-paradise
set background=dark
set guifont=Menlo:h12

" Allow autocomplete to ignore the case but autocomplete with correct case
" set ignorecase
set infercase

if has('gui_running')
  set cursorline
endif

" Text formatting
set nowrap
set ai
set tabstop=4 shiftwidth=4 expandtab

" For highlighting html in javascript
let g:jsx_ext_required=0
let g:javascript_enable_domhtmlcss=1

" Ultisnips
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
set number
" set relativenumber

autocmd BufNewFile,BufRead *.js,*.es6,*.jsx set filetype=javascript.jsx " add HTML syntax highlighting to js files


" CtrlP settings
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_map = '<C-p>'

" Syntastic Settings
let g:syntastic_javascript_checkers = ['eslint']
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" NeoComplete settings
let g:acp_enableAtStartup = 0 " Disable original Autocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2

nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo synIDattr(synIDtrans(synID(line("."), col("."), 1)), "fg") map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
