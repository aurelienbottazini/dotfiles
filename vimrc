" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

let mapleader = "\<Space>"
" Split edit your vimrc. Type space, v, r in sequence to trigger
nmap <leader>vr :e $MYVIMRC<cr>

" Source (reload) your vimrc. Type space, s, o in sequence to trigger
nmap <leader>so :source $MYVIMRC<cr>
" save with Control s
nmap <C-s> :w<cr>
" easily escape from insert mode
imap jk <esc>
imap kj <esc>

call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-sensible' " base set of configurations
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'thoughtbot/vim-rspec'
Plug 'christoomey/vim-tmux-runner'
Plug 'nanotech/jellybeans.vim'
call plug#end()

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0
" Let ctrlp have up to 30 results.
let g:ctrlp_max_height = 30

filetype plugin indent on " Filetype auto-detection
syntax on " Syntax highlighting

set tabstop=4

set shiftwidth=4
set softtabstop=4
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.

" We have VCS -- we don't need this stuff.
set nobackup " We have vcs, we don't need backups.
set nowritebackup " We have vcs, we don't need backups.
set noswapfile " They're just annoying. Who likes them?

" don't nag me when hiding buffers
set hidden " allow me to have buffers with unsaved changes.
set autoread " when a file has changed on disk, just load it. Don't ask.

" Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.

" allow the cursor to go anywhere in visual block mode.
set virtualedit+=block

set relativenumber
set number
set backspace=indent,eol,start  " Sane backspace behavior
set history=1000                " Remember last 1000 commands
set scrolloff=4                 " Keep at least 4 lines below cursor
set hidden                      " Allow buffer change w/o saving
set lazyredraw                  " Don't update while executing macros
" Visual line nav, not real line nav
" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that.
noremap j gj
noremap k gk

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

let g:rspec_command = "call VtrSendCommand('dcr web bundle exec rspec {spec}')"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
colorscheme jellybeans
