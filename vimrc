set nocompatible            " Don't make Vim vi-compatible.
" ---------------------------------------------------------------------------- "
" Plug                                                                         "
" ---------------------------------------------------------------------------- "
" install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd vimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/bundle')

" utils
Plug 'scrooloose/nerdcommenter'
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" style
Plug 'vim-airline/vim-airline'
Plug 'luochen1990/rainbow'
Plug 'haishanh/night-owl.vim'

call plug#end()

" ---------------------------------------------------------------------------- "
" General Settings                                                             "
" ---------------------------------------------------------------------------- "

filetype plugin indent on
set history=200             " Remember more commands
set autoread                " Auto reload file after external command
set wildmenu                " Visual autocomplete for command menu
set ttyfast                 " Fast terminal
set title
set ttymouse=xterm2
set binary                  " Enable binary support

set nowrap                  " Don't wrap long lines
set scrolloff=3             " Keep at least 3 lines above/below
set noshowmode              " Don't show current mode
set showmatch               " Show matching bracket/parenthesis/etc
set matchtime=2
set showcmd                 " Show incomplete command
set lazyredraw              " redraw only when needed(not in execution of macro)
set synmaxcol=2500          " Limit syntax highlighting (this
                            " avoids the very slow redrawing
                            " when files contain long lines).
                            
 " Use the system clipboard
set clipboard=unnamed       
if has("unnamedplus")       
  set clipboard+=unnamedplus
endif                       

if has('mouse')
  set mouse=a
  set mousehide
endif

" indentation
set smarttab
set smartindent
set autoindent
set backspace=2
set cindent

set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

" search
set ignorecase
set smartcase
set hlsearch

" syntax and style
set background=dark
set encoding=utf-8
set laststatus=2

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

colorscheme night-owl
syntax enable


set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Persistent undo
" Create undo dir if not exists
if empty(glob('~/.vim/undo'))
  silent !mkdir ~/.vim/undo
else
  set undofile
  set undodir=$HOME/.vim/undo
endif

set noswapfile
set nobackup

" Treat given characters as a word boundary
set iskeyword-=.                " Make '.' end of word designator
set iskeyword-=#                " Make '#' end of word designator
set splitright                  " Vertical split right

let mapleader=","

" Return to last edit position when opening files
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" ---------------------------------------------------------------------------- "
" General Mappings                                                             "
" ---------------------------------------------------------------------------- "

" tab navigation
map <Tab> :bn<CR>
map <S-Tab> :bp<CR>

"" Close buffer
noremap <Leader>c :bd<CR>
"" Clear search highlight
nnoremap <silent> <Leader><space> :noh<cr>
" Toggle wrap mode
nnoremap <Leader>wr :set wrap!<CR>
" Fast save
nnoremap <Leader><Leader> :w<cr>

" HARDMODE
" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
" " Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>re :call RenameFile()<cr>

" [,* ] Search and replace the word under the cursor.
nmap <Leader>* :%s/\<<C-r><C-w>\>//<Left>

" replace the word with last yanked text
nnoremap <Leader>pr viw"0p

" Switch CWD to the directory of the open buffer
map <Leader>cd :cd %:p:h<cr>:pwd<cr>

" ---------------------------------------------------------------------------- "
" Plugin Configuration                                                         "
" ---------------------------------------------------------------------------- "

" Rainbow
let g:rainbow_active = 1

" Airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs= 1
let g:arline#extensions#virtualenv#enabled = 1
let g:airline#extensions#whitespace#enabled = 0

" NERDComment
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

nnoremap <Leader>cc NERDComComment
nnoremap <Leader>c<space> NERDComToggleComment
nnoremap <Leader>cs NERDComSexyComment
