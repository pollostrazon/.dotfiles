" Just because it is the right thing
set encoding=UTF-8
set nocompatible
filetype off
autocmd! BufRead,BufNewFile *.ino set filetype=c syntax=arduino

" vim-plug plugins
call plug#begin()
Plug 'flazz/vim-colorschemes'        " One colorscheme pack to rule them all
Plug 'tomasr/molokai'                " Molokai color scheme
Plug 'scrooloose/syntastic'          " Syntax checking hacks for Vim
Plug 'majutsushi/tagbar'             " Display tags in a window
Plug 'SirVer/ultisnips'              " The ultimate snippet solution
Plug 'sheerun/vim-polyglot'          " A solid language pack for Vim
Plug 'bling/vim-airline'             " Lean & mean status/tabline
Plug 'tpope/vim-fugitive'            " An awesome git wrapper
Plug 'terryma/vim-multiple-cursors'  " Sublime Text style multiple selection
Plug 'thinca/vim-quickrun'           " Run commands quickly
Plug 'tpope/vim-sensible'            " Defaults everyone can agree on
Plug 'mhinz/vim-signify'             " Show a diff via Vim sign column
Plug 'honza/vim-snippets'            " UltiSnips snippets
Plug 'mhinz/vim-startify'            " A fancy start screen
Plug 'tpope/vim-unimpaired'          " Pairs of handy bracket mappings
Plug 'mattn/emmet-vim'               " Emmet for vim (html hacks, ...)
Plug 'ap/vim-css-color'              " Preview colours in source code
Plug 'vim-scripts/LanguageTool',     { 'on':  'LanguageToolCheck' }  " Grammar checker in vim
Plug 'scrooloose/nerdtree',          { 'on':  'NERDTreeToggle' }     " A tree explorer plugin
Plug 'ternjs/tern_for_vim',          { 'for': 'javascript', 'do': 'npm install', 'frozen': 1 }
Plug 'nvie/vim-flake8',              { 'on': 'Flake8' }              " Flake8 plugin for Vim
Plug 'rdnetto/YCM-Generator',        { 'branch': 'stable' }          " YouCompleteMe generator
Plug 'Valloric/YouCompleteMe', { 'for': ['c','cpp','javascript','python', 'ino'], 'do': './install.py --clang-completer', 'frozen': 1 }
Plug 'ryanoasis/vim-devicons'        "Adds file type icons to Vim plugins    
call plug#end()

" Syntax highlight
syntax enable

" Show line number
set number

" Autocomplete for cmd menu
set wildmenu

" For a better Vim
noremap j gj
noremap k gk
set backspace=indent,eol,start
" ctrl-space quits insert mode and does bad things.
" Stop that!
" One way of testing: :^K^space:
" Other possible ways of saying it: <Nul>, <Char-0>, <C- >, <C-@>
" p0g on #vim finally found the answer: imap is the important one.
imap <Nul> <Space>
map <Nul> <Nop>
vmap <Nul> <Nop>
cmap <Nul> <Nop>
nmap <Nul> <Nop>

" Cursor won't reach first/last line
set scrolloff=1

" Search opts
set ignorecase
set smartcase
set incsearch
set hlsearch
map <C-l> :nohlsearch<CR>

" Tabs
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab

" Use a single folder for swap files
set directory=~/.vim/swap,.

" Maintain undo history
set undofile
set undodir=~/.vim/undo,.

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Tagbar settings
nmap <F8> :TagbarToggle<CR>

" Ultisnips settings
set runtimepath+=~/.vim/mySnips/
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:ultisnips_python_style="numpy"

" vim-airline settings
set laststatus=2
let g:airline#extensions#whitespace#show_message = 0
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_splits = 1

" Quickrun settings
let g:quickrun_config = {}
let g:quickrun_config._ = {'outputter': 'message'}

" Emmet settings
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" NERDTree settings
map <F4> :NERDTreeToggle<CR>

" Language tool
let g:languagetool_jar='/opt/LanguageTool/languagetool-commandline.jar'

" YouCompleteMe
let g:ycm_confirm_extra_conf = 0
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_goto_buffer_command = 'new-or-existing-tab'
let g:ycm_global_ycm_extra_conf = '~/.vim/plugin/.ycm_extra_conf.py'
nnoremap <leader>f :YcmCompleter FixIt<CR>
nnoremap <leader>g :YcmCompleter GoTo<CR>

" Vim Theme settings
set t_Co=256
set background=dark
colorscheme 256-jungle
"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif
