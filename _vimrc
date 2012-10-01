" _vimrc
" Author: Alec Dibble
" Last modified: Mon Oct 01, 2012  07:52AM
"

" Enhanced command line complete
set wildmenu

" Show line numbers
set number

" Set the forward slash to be the slash of note
set shellslash

" Make command line two lines high
set ch=2

" Set visual bell
set vb

" Allow backspacing over ident, eol, and the start of an insert
set backspace=2

" Tell Vim to always put a status line in, even with 1 window
set laststatus=2

" Remove gui options to hide toolbars and menus
set guioptions=ac

" Expand history
set history=100

" Enable omnicompletion
filetype plugin on
set ofu=syntaxcomplete#Complete

" Forget being compatible with good ol' vi
set nocompatible

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

" Turn on that syntax highlighting
syntax on

" Don't update the display while executing macros
set lazyredraw

" At least let yourself know what mode you're in
set showmode

" Edit vimrc file use the ev alias
nmap <silent> ,,ev :e $MYVIMRC<cr>

" Source vimrc file use the sv alias
nmap <silent> ,,sv :so $MYVIMRC<cr>

" Make escape key map to "jj"
:imap jj <Esc>

" If buffer modified, update any 'Last modified: ' in the first 20 lines.
" 'Last modified: ' can have up to 10 characters before (they are retained).
" Restores cursor and window position using save_cursor variable.
function! LastModified()
  if &modified
    let save_cursor = getpos(".")
    let n = min([20, line("$")])
    keepjumps exe '1,' . n . 's#^\(.\{,10}Last modified: \).*#\1' .
          \ strftime('%a %b %d, %Y  %I:%M%p') . '#e'
    call histdel('search', -1)
    call setpos('.', save_cursor)
  endif
endfun
autocmd BufWritePre * call LastModified()

" Add easy buffer switching by pushing F5 and then buffer number
:nnoremap <F5> :buffers<CR>:buffer<Space>

" Check to see if macvim is running to implement Mac specific
" functions such as shortcuts
if has("gui_macvim")
  "set guifont=Monaco:h13
  "To do:
  "Add page up and page down to shortcut keys
  "Change buffer switching to a different shortcut key
endif

" Set plugin path to ~/.vim/bundle (~\vimfiles\bundle\)
runtime bundle/autoload/pathogen.vim
call pathogen#infect()


