" Just because it is the right thing
set nocompatible
filetype off

" vim-plug plugins
call plug#begin()
Plug 'tomasr/molokai'                " Molokai color scheme
Plug 'scrooloose/syntastic'          " Syntax checking hacks for Vim
Plug 'majutsushi/tagbar'             " Display tags in a window
Plug 'SirVer/ultisnips'              " The ultimate snippet solution
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
Plug 'alvan/vim-closetag'            " Auto close (X)HTML tags
Plug 'ap/vim-css-color'              " Preview colours in source code
Plug 'vim-scripts/LanguageTool',     { 'on':  'LanguageToolCheck' }  " Grammar checker in vim
Plug 'scrooloose/nerdtree',          { 'on':  'NERDTreeToggle' }     " A tree explorer plugin
Plug 'ternjs/tern_for_vim',          { 'for': 'javascript', 'do': 'npm install', 'frozen': 1 }
Plug 'nvie/vim-flake8',              { 'on': 'Flake8' }              " Flake8 plugin for Vim
Plug 'rdnetto/YCM-Generator',        { 'branch': 'stable' }          " YouCompleteMe generator
Plug 'Valloric/YouCompleteMe', { 'for': ['c','cpp','javascript','python'], 'do': './install.py --clang-completer', 'frozen': 1 }
call plug#end()

" Syntax highlight
syntax enable

" Enable 256 colors
set t_Co=256

" Show line number
set number

" Autocomplete for cmd menu
set wildmenu

" For a better Vim
noremap j gj
noremap k gk
set backspace=indent,eol,start

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
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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
nnoremap <leader>f :YcmCompleter FixIt<CR>
nnoremap <leader>g :YcmCompleter GoTo<CR>

" Vim Theme settings
silent! colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
highlight Normal ctermbg=NONE
