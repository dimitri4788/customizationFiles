call pathogen#infect()

" Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

"Set the color scheme
"colorscheme xoria256
set background=dark
"let g:solarized_termcolors=256
colorscheme solarized

"To show colors in vim-editor, e.g. this file is colorful
syntax on

"Sets the line/column ruler at the bottom
set ruler
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

"Make highlighting ON while searching using '/pattern' command
set hls "Type :noh to un-higlight the highlighted text

"Allow backspacing over everything in insert mode
set backspace=indent,eol,start

"Keep 10000 lines of command line history
set history=10000

"Display incomplete commands
set showcmd

"Display the match for a search pattern when halfway typing it
set incsearch

"Enabling the mouse
"if has('mouse')
"  set mouse=a
"endif

if has("autocmd")
  "Enable file type detection
  filetype plugin indent on
  
  "For all text files set 'textwidth' to 78 characters
 " autocmd FileType text setlocal textwidth=78

else
  "Makes vim use the indent of the previous line for the newly created line
  set autoindent "Always set autoindenting on

endif

"Switch long-lines wrapping off
"set nowrap


"Most commands for moving around will stop moving at the start and end of a
"line.  You can change that with the 'whichwrap' option.  This sets it to the
"default value
set whichwrap=b,s,<,>,[,]

"Make :grep options available (recurse, show line numbers)
set grepprg=grep\ -nr

"Set textwidth
"set textwidth=80

"Set indents to 4. Also making it for C programs.
"set autoindent
"set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

"Auto indent after a {
set cindent 

"Set <Tab> key insert 4 spaces
"set softtabstop=4

"Switch on the ignorecase option
set ignorecase
set smartcase

"Turn-off parenthesis matching
let loaded_matchparen=1

"Enable line numbers
set number

"Mapping code/text completion using tab instead of ctrl-p in insert mode
imap <Tab> <C-p>

"Mapping double ESC press to :noh (remove highlighting)
nnoremap <ESC><ESC> :noh<CR>

"Always set status line
set laststatus=2

"Mapping some operations to Ctrl-key (type *unmap keyName where * is either
"   i,v,n)
"imap <c-v> <esc>pi
"nmap <c-v> p
"
"



"Uncomment the following to have Vim jump to the last position when
"reopening a file
if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"Golang related stuff
set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
