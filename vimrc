" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

let mapleader = "\<Space>"
" Split edit your vimrc. Type space, v, r in sequence to trigger
nmap <leader>vr :e `=resolve(expand("~/.vimrc"))`<cr>
nmap <leader>c :VtrSendCommandToRunner<space>
map <Leader><Leader> :VtrSendCommandToRunner<CR>
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
Plug 'tpope/vim-fugitive'
Plug 'thoughtbot/vim-rspec'
Plug 'christoomey/vim-tmux-runner'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
Plug 'vim-ruby/vim-ruby'
Plug 'bling/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'mkitt/tabline.vim'
Plug 'rking/ag.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-unimpaired'
Plug 'skwp/greplace.vim'
Plug 'suan/vim-instant-markdown'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'bronson/vim-visual-star-search'
Plug 'mattn/emmet-vim'
call plug#end()


" Use Silver Searcher instead of grep
set grepprg=ag\ --nogroup\ --column
" set grepprg=ag
set grepformat=%f:%l:%c:%m
let g:grep_cmd_opts = '--line-numbers --noheading'
" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0
" Let ctrlp have up to 30 results.
let g:ctrlp_max_height = 30

filetype plugin indent on " Filetype auto-detection
syntax on " Syntax highlighting

" set tabstop=4
" set shiftwidth=4
" set softtabstop=4
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
" set gdefault " use the `g` flag by default.

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
nnoremap <leader>z :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

let g:rspec_command = "call VtrSendCommand('dcr web bundle exec rspec {spec}')"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
set background=dark
colorscheme solarized
" let g:solarized_termcolors=256

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline_powerline_fonts = 1

let g:ag_working_path_mode="r" " ag search from project root instead of cwd
noremap <Leader>f :Ag<Space>
:nnoremap <leader>b :buffers<CR>:buffer<Space>

set expandtab
set shiftwidth=2
set softtabstop=2
set encoding=utf-8

map <leader>gs :Gstatus<CR>
map <leader>gl :Gbrowse!<CR>
map <leader>gp :Gpush<CR>
map <leader>e :Explore<CR>

let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsListSnippets="<c-q>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

command! W w " Bind W to w since sometimes I hold shift too long
command! Q q " Bind Q to q since sometimes I hold shift too long

" Emacs-like beginning and end of line.
imap <c-e> <c-o>$
imap <c-a> <c-o>^

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_enable_signs = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop']

map <leader>lo :lopen<cr>
map <leader>lc :lcl<cr>

" remove whitespace
nmap <leader>ww :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<Bar>:w<CR>
" save as sudo user
nmap <leader>ws :w !sudo tee % > /dev/null
map <leader>r :Gsearch<space>
map <leader>a :A<CR>
map <leader>d :redraw!<cr>

set clipboard=unnamed " copy paste within tmux

" Easier to see current paths, with one path per line
command! Path :call EchoPath()
function! EchoPath()
    echo join(split(&path, ","), "\n")
endfunction

" Easier to see which tag files are used. One tag file per line
command! TagFiles :call EchoTags()
function! EchoTags()
    echo join(split(&tags, ","), "\n")
endfunction

set guifont=PragmataPro:h14
set cursorline
set cursorcolumn
set colorcolumn=80

hi CursorLineNr term=NONE ctermfg=3 gui=bold guifg=Yellow
