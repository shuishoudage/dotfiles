" Author:
"       Amir Salihefendic
"       http://amix.dk - amix@amix.dk
" Version: 
"
"       5.0 - 29/05/12 15:43:36
"
" Blog_post: 
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
"
" Raw_version: 
"       http://amix.dk/vim/vimrc.txt
"
" Sections:
"    -> General and Plugins with setting
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect('~/.vim/bundle/{}')
syntax on
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DO NOT PUT MAPPING HERE, otherwise, it will not be excuted
" be improved, required, if not set it will compatible with Vi
" which means it will reduce the functionality of vim
set nocompatible    
filetype off                  " required

" by using :find functionality we have to set the searching path first 
set path+=~/Desktop/Programming/**
set path+=~/Google_Drive/**

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/share/vim/vim80/doc
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'

" this plugin for the vim layout 
Plugin 'vim-airline/vim-airline'
" let g:airline_powerline_fonts=1
" let g:airline#extensions#tabline#enabled = 1

" adding autocompletion functionality
Plugin 'ervandew/supertab'
let g:SuperTabMappingForward = '<nul>'
let g:SuperTabMappingBackward = '<s-nul>'

" asynctask runner
Plugin 'skywind3000/asynctasks.vim'
Plugin 'skywind3000/asyncrun.vim'
let g:asyncrun_open = 6

" golang plugin
Plugin 'fatih/vim-go'

Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='powerlineish'

Plugin 'bkad/CamelCaseMotion'
let g:camelcasemotion_key = '<leader>'

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => language support 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" c language support
" Plugin 'WolfgangMehner/c.vim'
" let g:C_Ctrl_j = 'off'

" scala support  
" Plugin 'derekwyatt/vim-scala'

" HTML supporting zen coding
" Plugin 'mattn/emmet-vim' 

" python mode plugin
Plugin 'klen/python-mode'
set nofoldenable
let g:pymode_folding = 0
let g:pymode_repo = 0
let g:pymode_repo_lookup_project = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => functional support 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" another auto completion engine for nodejs
" Plugin 'ternjs/tern_for_vim'


" Markdown enrichment
Plugin 'SidOfc/mkdx'
" :h mkdx-settings
let g:mkdx#settings = {
      \ 'image_extension_pattern': 'a\?png\|jpe\?g\|gif',
      \ 'restore_visual':          1,
      \ 'enter':                   { 'enable': 1, 'malformed': 1, 'o': 1,
      \                              'shifto': 1, 'shift': 0 },
      \ 'map':                     { 'prefix': '<leader>', 'enable': 1 },
      \ 'tokens':                  { 'enter': ['-', '*', '>'],
      \                              'bold': '**', 'italic': '*', 'strike': '',
      \                              'list': '-', 'fence': '',
      \                              'header': '#' },
      \ 'checkbox':                { 'toggles': [' ', '-', 'x'],
      \                              'update_tree': 2,
      \                              'initial_state': ' ' },
      \ 'toc':                     { 'text': "TOC", 'list_token': '-',
      \                              'update_on_write': 0,
      \                              'position': 0,
      \                              'details': {
      \                                 'enable': 0,
      \                                 'summary': 'Click to expand {{toc.text}}',
      \                                 'nesting_level': -1,
      \                                 'child_count': 5,
      \                                 'child_summary': 'show {{count}} items'
      \                              }
      \                            },
      \ 'table':                   { 'divider': '|',
      \                              'header_divider': '-',
      \                              'align': {
      \                                 'left':    [],
      \                                 'center':  [],
      \                                 'right':   [],
      \                                 'default': 'center'
      \                              }
      \                            },
      \ 'links':                   { 'external': {
      \                                 'enable': 0, 'timeout': 3, 'host': '', 'relative': 1,
      \                                 'user_agent':  'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/9001.0.0000.000 vim-mkdx/1.9.1'
      \                              },
      \                              'fragment': {
      \                                 'jumplist': 1,
      \                                 'complete': 1
      \                              }
      \                            },
      \ 'highlight':               { 'enable': 0 },
      \ 'auto_update':             { 'enable': 0 }
    \ }

" plugin for quick navigate --> esay motion
Plugin 'easymotion/vim-easymotion'

" vim-surrond for change ** surrond ** mark
Plugin 'tpope/vim-surround'
let g:surround_42="**\r**"

" vim-comments
Plugin 'tpope/vim-commentary'

" this plugin for quick search in the path 
" Plugin 'kien/ctrlp.vim'

" this plugin for create a directory tree
Plugin 'scrooloose/nerdtree'
"nnoremap <leader>nd :NERDTreeToggle<CR> 
" load nerdtree when login vim
" autocmd vimenter * NERDTree
let g:NERDTreeMapOpenInTab = '\n' 
let g:NERDTreeWinPos = "right" " always open nerdtree at right hand position 
let g:NERDTreeWinSize = 50


" this plugin for auto close ( or " or {  
Plugin 'Raimondi/delimitMate'

" Track the engine
Plugin 'honza/vim-snippets'

" add google translation
Plugin 'echuraev/translate-shell.vim'
let g:trans_default_direction = ":zh"

" All of your Plugins must be added before the following line
call vundle#end()       "required
" Enable filetype plugins
filetype plugin indent on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Sets how many lines of history VIM has to remember
set history=70

set shortmess+=c

" set the cursor line in order to track where cursor is 
set cursorline
highlight CursorLine ctermbg=155

set completeopt=menuone,noselect,noinsert

" set cursor in different mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

"allow html snippets run on php
au BufRead,BufNewfile *.php set ft=php.html

" set line number left
set number

" set increse searching
set incsearch

" set clipborad copy and paste
set clipboard=unnamed

" when scroll down and up before three lines
set scrolloff=3

" Set to auto read when a file is changed from the outside
set autoread

" set esc not delary
set timeoutlen=1000 ttimeoutlen=0

" set the relative line number
" set relativenumber 

let mapleader = ","

let g:mapleader = ","

" Fast saving
" entering to indent mode first (gg=G), However this will leader the cursor
" jump to top of the file
" then we using <c-o><c-o> to jump back again, then saving file
nnoremap <leader>w :normal gg=G<c-o><c-o>:w!<cr>

" Save and execute the vimrc file
nnoremap <leader>s :so %<cr>

" edit my vimrc quickly 
nnoremap <leader>em :split $MYVIMRC<cr>

" save and close
nnoremap <leader>q :wq<cr>


let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu
set wildchar=<TAB>
set wildmode=list:longest,full


" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
set ruler

set showcmd

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
"set showmatch 

" How many tenths of a second to blink when matching brackets
"set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set tm=500

" Add a bit extra margin to the left
set foldcolumn=5


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

try
    colorscheme desert
catch
endtry

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

set guifont=Monaco\ for\ Powerline:h16
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab = 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent

" set c indent
set cindent


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
" map <C-n> <C-W>j
" map <C-p> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>tj :tabnext<cr>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
" autocmd BufReadPost *
"    \ if line("'\"") > 0 && line("'\"") <= line("$") |
"    \   exe normal! g`\"" |
"    \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" width of a documentation
set tw=100

" set color columne
set colorcolumn=100

" set the highlight color for rightside line
highlight ColorColumn ctermbg=50 

set wrap "Wrap lines

"set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
" noremap means no recursive mapping 
" suppose we have       map a jj
" and                   map p a
" if recursive will let when pressing p just like jj
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
nnoremap 0 ^

" mapping G to Gzz
nnoremap G Gzz

" make save simple
nnoremap ss :w<CR>


"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
vnoremap <Up> :m '<-2<CR>gv=gv
vnoremap <Down> :m '>+1<CR>gv=gv


" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)


" mapping google translate
nnoremap <silent> <leader>t :Trans<CR>
vnoremap <silent> <leader>t :Trans<CR>

" mapping for convert lowercase to uppercase
nnoremap <c-u> viW<s-u>


if has("mac") || has("macunix")
    nnoremap <D-j> <M-j>
    nnoremap <D-k> <M-k>
    vnoremap <D-j> <M-j>
    vnoremap <D-k> <M-k>
endif

" compiler c programing
nnoremap <leader>c :! gcc % -o %< <cr>

" compiler c programing with gtk
" nnoremap <leader>t :! gcc `pkg-config --cflags gtk+-3.0` % -w -o %< `pkg-config --libs gtk+-3.0` <cr>

" run c programing
nnoremap <leader>r \rr

" sorting Quickly
noremap <leader>so :sort<CR>

" remap ESC key to fd
inoremap fd <Esc>
vnoremap fd <Esc> 

" Mimic Emacs Line Editing in Insert Mode Only
inoremap <C-A> <Home>
inoremap <C-B> <Left>
inoremap <C-E> <End>
inoremap <C-F> <Right>
inoremap <C-K> <Esc>lDa


" insert empty line by hitting Enter or S-Enter 
nnoremap <CR> o<Esc>k
nnoremap <C-Enter> O<Esc>j


" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc

" trim empty space of trailing file
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
" indent file when opening file by following extension
autocmd BufRead *.html,*.c,*.cpp,*.h :normal gg=G

" map cmd+s to save file
map <M-s> :w<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack searching and cope displaying 
" requires ack.vim - it's much better than vimgrep/grep 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" When you press gv you  Ack after the selected text 
" vnoremap <silent> gv :call VisualSelection('gv', '')<CR> 
" Open Ack and put the cursor in the right position
nnoremap <leader>g :Ack 

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

nnoremap <leader>cc :botright cope<cr>
nnoremap <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
"map <leader>n :cn<cr>
nnoremap <leader>p :cp<cr>

" moving block of code
vnoremap < <gv 
vnoremap > >gv 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
nnoremap <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
nnoremap <leader>sn ]s
nnoremap <leader>sp [s
nnoremap <leader>sa zg
nnoremap <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => abbrivation 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iabbr eml pantaotao@icloud.com


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a markdown buffer for scribble
nnoremap <leader>x :tabedit ~/buffer.md<cr>

" Toggle paste mode on and off
nnoremap <leader>pp :setlocal paste!<cr>

nnoremap <leader>h :Helptags<cr>:h 


" open nerdertree 
nnoremap <leader>on :NERDTree<cr>
" close nerdtree
nnoremap <leader>cn :NERDTreeClose<cr>

" this is operation mapping, this map will change w as iw
onoremap w iw



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! AddSpaceFollowComma()
    f,a<ESC>;.
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

:" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

