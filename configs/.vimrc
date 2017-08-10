if !has('nvim')
	set nocompatible
	set encoding=utf-8
endif

"{{{
" vim's vimrc_example and msvim already sets up backup and swap
" set swap(.swp),backup(~),undo(.udf) directory to vim installation
" Please make sure the directory exists otherwise current directory will be used
" set dir=E:\\bak\\vim\\swp
" set backupdir=E:\\bak\\vim\\bak
" Remember the undo history for file, doesn't work with file collisions
" set udf
" set udir=E:\\bak\\vim\\undo
"}}}

set list
set listchars=tab:⇒\ ,eol:•,trail:ᛋ
set showbreak=»»

set fileformat=unix

"{{{ Tab stuff
set tabstop=4       " The width of a TAB is set to 4.  Still it is a \t. It is just that Vim will interpret it to be having a width of 4.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
if !has('nvim')
	set smarttab
	set autoindent
endif
"}}}

"{{{ Search
if !has('nvim')
	set incsearch
	set hlsearch
endif
set smartcase
set wrapscan
"}}}

"{{{
set cursorline
set cursorcolumn
set colorcolumn=80
hi ColorColumn ctermbg=darkred
"}}}

set ruler
if !has('nvim')
	set laststatus=2
	set wildmenu
	set autoread                  " watch for file changes
	set backspace=indent,eol,start
endif
set wildmode=longest,full
set ignorecase
set smartcase
set showmode
set showcmd
" filetype on                   " Enable filetype detection
" filetype indent on            " Enable filetype-specific indenting
" filetype plugin on            " Enable filetype-specific plugins
syntax enable

set guioptions-=T
set guioptions-=e
set linespace=5

let g:netrw_browse_split=2

set matchpairs+=<:>
" runtime macros/matchit.vim

"{{{ autocommands
autocmd BufEnter * silent! lcd %:p:h
autocmd BufEnter * setlocal relativenumber
autocmd BufEnter * setlocal number
autocmd BufLeave * setlocal norelativenumber
autocmd BufLeave * setlocal nonumber
"}}}

"{{{ Mappings
inoremap jk <esc>
" These commands aren't written to undo history. <c-g>u fixes this.
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" Each return is a new undo point
inoremap <CR> <C-G>u<CR>

noremap j gj
noremap k gk
noremap Y y$
noremap <F1> :h <C-r><C-w><CR>
noremap <F2> :e $MYVIMRC<CR>
nnoremap <F3> :source $MYVIMRC<CR>:echo "vimrc reloaded"<CR>
noremap <F8> :Explore<CR>
noremap <F9> :TlistToggle<CR>

noremap <Left> <C-w>h
noremap <Right> <C-w>l
noremap <Up> <C-w>k
noremap <Down> <C-w>j

noremap <leader>p "+p
noremap <space> za

vnoremap < <gv
vnoremap > >gv

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

iabbrev #C Copyright <C-r>=strftime("%Y")<CR> Smoothwall Ltd.
"}}}

if !has('nvim')
	set mouse=a
endif

"{{{ Plugins
"{{{ Vundle
" set the runtime path to include Vundle and initialize
if has('win32')
	set rtp+=~/vimfiles/bundle/Vundle.vim
else
	set rtp+=~/.vim/bundle/Vundle.vim
endif
" has('gui_running')

call vundle#begin()
" Keep Plugin commands between vundle#begin/end.
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" plugin on GitHub repo

Plugin 'bad-whitespace'
Plugin 'bling/vim-airline.git'
Plugin 'chrisbra/Colorizer.git'
Plugin 'chrisbra/changesPlugin.git'
Plugin 'ctrlpvim/ctrlp.vim.git'
Plugin 'godlygeek/tabular.git'
Plugin 'lokaltog/vim-distinguished'
Plugin 'scrooloose/syntastic.git'
Plugin 'surround.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch.git'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-obsession.git'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-perl/vim-perl.git'
Plugin 'gaosld/vim-scripts-taglist'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'smancill/conky-syntax.vim'

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'pkukulak/idle'

Plugin 'tpope/vim-jdaddy'
Plugin 'https://github.com/edsono/vim-matchit.git'

Plugin 'https://github.com/Valloric/YouCompleteMe.git'
Plugin 'https://github.com/leafgarland/typescript-vim.git'
Plugin 'https://github.com/Quramy/tsuquyomi.git'
Plugin 'https://github.com/Shougo/vimproc.vim'

Plugin 'mtscout6/syntastic-local-eslint.vim'

if has('unix')
		" "				" Syntastic - Perl Checker Settings
		let g:syntastic_enable_perl_checker = 1
		let g:syntastic_perl_checkers = [ 'perl', 'podchecker', 'perlcritic' ]
	Plugin 'tpope/vim-eunuch.git'
	Plugin 'tpope/vim-tbone.git'
	Plugin 'https://github.com/guns/xterm-color-table.vim.git'
    Plugin 'tmux-plugins/vim-tmux'
endif

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" autocmd VimEnter * PluginUpdate

" see :h vundle for more details or wiki for FAQ
"}}}

"{{{ Syntastic Plugin Settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_balloons = 1
let g:syntastic_mode_map = { 'mode': 'active',
    \ "active_filetypes" : ['javascript'],
    \ "passive_filetypes" : []
\ }
let g:syntastic_javascript_checkers = ['eslint']
let g:airline#extensions#syntastic#enabled = 1
"}}}

let g:colorizer_auto_filetype='css,html,php,vim'
set omnifunc=syntaxcomplete#Complete

"{{{ Tlist
" let Tlist_Ctags_Cmd='C:\Program Files\ctags58\ctags.exe'
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Auto_Update = 1
let Tlist_Display_Prototype = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Inc_Winwidth = 0	"Don't resize window on open taglist
let Tlist_Show_Menu = 1		"Gvim
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 40
"}}}
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
"}}}

" colorscheme harlequin
colorscheme distinguished
highlight SpellBad ctermfg=202 ctermbg=52 cterm=bold
" Needed to prevent cursorline hiding typos. This repo has stagnated so no
" point pushing a fix upstream.

"{{{
function! SmartStartLine()
    if virtcol('.') != 1
        normal |
        echo "|"
    else
        normal ^
        echo "^"
    endif
endfunction

nnoremap 0 :call SmartStartLine()<cr>
nnoremap <k0> :call SmartStartLine()<cr>

function! Refresh()
    let originalLine=line(".")
    :silent! :e
    normal G
    let newLine=line(".")
    if originalLine != newLine
        echo "Line changed: Δ" newLine-originalLine
    else
        echo "No change"
    endif
endfunction
nnoremap <F5> :call Refresh()<cr>
"}}}

set secure

 " vim:foldmethod=marker:
