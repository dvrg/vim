set nocompatible    " be iMproved, required
filetype off        " required

" set the runtime path inculde Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" keep plugin commands between vundle#begin/end

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" For auto completion script
Plugin 'Valloric/YouCompleteMe'

" Git Wrapper
Plugin 'tpope/vim-fugitive'

" tree explorer
Plugin 'scrooloose/nerdtree'

" Nerdtree git flag
Plugin 'Xuyuanp/nerdtree-git-plugin'

" status/tibeline for vim
Plugin 'vim-airline/vim-airline'

" Solarize theme
Plugin 'altercation/vim-colors-solarized'

" Quoting made simple
Plugin 'tpope/vim-surround'

" Syntax Checking
Plugin 'scrooloose/syntastic'

" vim-gutter, show git diff
Plugin 'airblade/vim-gitgutter'

" wakatime, timetracker
Plugin 'wakatime/vim-wakatime'

" ctrlp
Plugin 'ctrlpvim/ctrlp.vim'

" All of your plugin must be added before th efollowing line
call vundle#end()           " required
filetype plugin indent on   " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append '!' to update or just :PluginUpdate
" :PluginSeach foo  - searches for foo; append '!' to refresh local cache
" :PluginClean      - confirms removal of unused plugin; append '!' to auto-approve removal
" see :h vundle for more details or wiki for FAQ
" put yout non-plugin stuff after this line

" Functional

" Syntastic
" Type Checker
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" remap key
inoremap jk <ESC>
let mapleader = " "

" NERDTree

" Automatic open NERDTree when vim startup
autocmd vimenter * NERDTree

" Show dotfiles
let NERDTreeShowHidden=1

" Show NERDTree by CTRL+n
map <C-n> :NERDTreeToggle<CR>

" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

" How can I open a NERDTree automatically when vim starts up if no files were specified?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"How can I open NERDTree automatically when vim starts up on opening a directory?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" How can I close vim if the only window left open is a NERDTree?
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" How can I close NERDTree window after opening a file in it
"autocmd BufEnter NERD_tree_* nmap  d<CR> <CR> :NERDTreeToggle <CR>
"autocmd BufLeave NERD_tree_* unmap d<CR>

" How can I make sure vim does not open files and other buffers on NerdTree window?
" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

" vim-airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Spellchecking
set spell spelllang=en_us

" Ctrlp settings
"" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
" MacOSX/Linux
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>
" Shared bindings from Solution #1 from earlier
nmap <leader>T :enew<cr>
nmap <leader>bq :bp <BAR> bd #<cr>

" For Aesthetic

" powerline integration fonts
let g:airline_powerline_fonts = 1

" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" Color schema by solarized
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
