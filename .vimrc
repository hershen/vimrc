set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" vim hardtime
Bundle 'takac/vim-hardtime'

" highlight C++
Plugin 'octol/vim-cpp-enhanced-highlight'

"vinegar.vim
Plugin 'dhruvasagar/vim-vinegar'

""palenight colorscheme
Plugin 'drewtempelmeyer/palenight.vim'

"airline
Plugin 'vim-airline/vim-airline'

"deoplete
if has('nvim')
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 0

"vimspector
Plugin 'puremourning/vimspector'
let g:vimspector_enable_mappings = 'HUMAN'
" nmap <leader>ds <Plug>VimspectorStepInto   --- not needed. The F11 keyboard " shortcut is for the Konsole terminal and can be disabled.
nmap <leader>dcb :call vimspector#ClearBreakpoints()<CR>
nmap <leader>dT <C-W>2k<C-W>2l
nmap <leader>dV <C-W>2h<C-W>3k
nmap <leader>dC <C-W>3h<C-W>2k<C-W>l

"Commenting plugin
" Plugin 'preservim/nerdcommenter'

"auto close bracket
" Plugin 'jiangmiao/auto-pairs'

"commentary plugin
Plugin 'tpope/vim-commentary'

" On by default
" let g:hardtime_default_on = 1

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = "\\"

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
"set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
"set t_Co=256 (discouraged in https://github.com/romainl/idiomatic-vimrc)
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1

" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
" colorscheme solarized

" Alon's addtions

" Set line numbers (from
" https://vi.stackexchange.com/questions/3/how-can-i-show-relative-line-numbers)
set number                     " Show current line number
set relativenumber             " Show relative line numbers

" Remap esc key. `^ means go to where the cursor was when exiting insert mode.
" inoremap jk <Esc>`^

"Turn on true colors
if (has("termguicolors"))
  set termguicolors
endif

"palenight colorscheme
colorscheme palenight

" Italics for my favorite color scheme
let g:palenight_terminal_italics=1

"color lines that go over 80 columns, where they do
"highlight ColorColumn ctermbg=red
"call matchadd('ColorColumn', '\%81v', 100)
"set colorcolumn=81
"

"don't make linebreaks
set textwidth=0 wrapmargin=0


"Enable omnicomplete
"filetype plugin on
set omnifunc=syntaxcomplete#Complete

"Enable reading project specific vimrc
set exrc
set secure

" Prevent clipboard hijacking
" (https://www.reddit.com/r/vim/comments/hqt7ij/prevent_clipboard_hijacking/)
inoremap  <C-r>+  <C-r><C-r>+
inoremap  <C-r>*  <C-r><C-r>*

" Map Esc to exit terminal mode
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

" Keep search line in middle of screen
nnoremap n nzz
nnoremap N Nzz
