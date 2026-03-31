---


```vim
" General
set nocompatible
set encoding=utf-8
set belloff=all
set helplang=ja
set re=0

" Syntax and colors
syntax on
set background=dark

if filereadable(expand("~/.vim/colors/lucius.vim"))
  colorscheme lucius
else
  colorscheme desert
endif

filetype plugin indent on

" Backup
set nobackup
set noswapfile
set autoread

" Persistent undo
if has('persistent_undo')
  let undo_path = expand('~/.vim/undo')
  if !isdirectory(undo_path)
    call mkdir(undo_path, "p")
  endif
  exe 'set undodir=' .. undo_path
  set undofile
endif

" Restore cursor position
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup END

" Display
set title
set number
highlight CursorLine guibg=#0000A0 ctermbg=gray
set cursorline

" Search
set hlsearch
set ignorecase
set smartcase
set incsearch

" Editing
set wrap
set nolist
set scrolloff=10
set whichwrap=b,s,h,l,<,>,[,],]
set backspace=indent,eol,start

" Indent
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Specific file handling
autocmd BufEnter Makefile setlocal noexpandtab
autocmd BufEnter Makefile setlocal nolist

" Brackets
set showmatch
set matchtime=1
set matchpairs& matchpairs+={:},<:>

" Clipboard
set clipboard+=unnamed

" Insert mode
inoremap jj <Esc>
