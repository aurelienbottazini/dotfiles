" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

let mapleader = "\<Space>"
" Split edit your vimrc. Type space, v, r in sequence to trigger
nmap <leader>ve :e $MYVIMRC<cr>
nmap <leader>c :VtrSendCommandToRunner<space>
map <Leader>x :VtrSendCommandToRunner<CR>
" Source (reload) your vimrc. Type space, s, o in sequence to trigger
nmap <leader>vr :source $MYVIMRC<cr>
" save with Control s
nmap <C-s> :w<cr>
" easily escape from insert mode
imap jk <esc>
imap kj <esc>

" fix 255 colors in tmux
" http://sunaku.github.io/vim-256color-bce.html
set t_ut=

" if has("termguicolors")  " set true colors
  " let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  " let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" endif

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim' " quickly find files
Plug 'tpope/vim-sensible' " base set of configurations
Plug 'tpope/vim-surround' " s to surround
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat' " better . support for plugins
Plug 'tpope/vim-commentary' " gc to comment
Plug 'thoughtbot/vim-rspec'
Plug 'christoomey/vim-tmux-runner' " send commands from vim to tmux
Plug 'jnurmine/Zenburn' " color theme
Plug 'tpope/vim-rake' " use rails.vim commands in non rails projects
Plug 'tpope/vim-bundler'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-airline/vim-airline' " better status and tab line
Plug 'vim-airline/vim-airline-themes' " better status and tab line
Plug 'mkitt/tabline.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'christoomey/vim-tmux-navigator' " seamless vim & tmux navigation
Plug 'tpope/vim-unimpaired' " [ ] mappings
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx' " react jsx
Plug 'bronson/vim-visual-star-search' " seach current selection with *
Plug 'cormacrelf/vim-colors-github'
Plug 'morhetz/gruvbox'
Plug 'chrisbra/Colorizer'
Plug 'posva/vim-vue'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
call plug#end()

let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Use Silver Searcher instead of grep
set grepprg=rg\ --vimgrep
" set grepprg=ag
set grepformat=%f:%l:%c:%m
let g:grep_cmd_opts = '--line-numbers --noheading'
let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob "!.git/*"'
let g:ctrlp_use_caching = 0
" Let ctrlp have up to 30 results.
let g:ctrlp_max_height = 30

filetype plugin indent on " Filetype auto-detection
syntax on " Syntax highlighting
let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox
set background=dark

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

" " allow the cursor to go anywhere in visual block mode.
set virtualedit+=block

set splitbelow splitright

" set relativenumber
" set number
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

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long' ]
let g:airline_theme='gruvbox'
let g:airline_symbols_ascii = 1

let g:ag_working_path_mode="r" " ag search from project root instead of cwd
noremap <Leader>f :Ag<Space>
:nnoremap <leader>b :buffers<CR>:buffer<Space>

set expandtab
set shiftwidth=2
set softtabstop=2
set encoding=utf-8

map <leader>e :Explore<CR>

command! W w " Bind W to w since sometimes I hold shift too long
command! Q q " Bind Q to q since sometimes I hold shift too long

" Emacs-like beginning and end of line.
imap <c-e> <c-o>$
imap <c-a> <c-o>^

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

map <leader>lo :lopen<cr>
map <leader>lc :lcl<cr>

" remove whitespace
nmap <leader>ww :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<Bar>:w<CR>
" save as sudo user
nmap <leader>ws :w !sudo tee % > /dev/null
map <leader>r :Gsearch<space>
map <leader>a :A<CR>
map <leader>d :redraw!<cr>

map <leader>or :ColorToggle<cr>
map <leader>oh :nohl<cr>

set clipboard=unnamed " copy paste within tmux

" Easier to see current paths, with one path per line
command! Path :call EchoPath()
function! EchoPath()
    echo join(split(&path, ","), "\n")
endfunction

" highlight matching words under cursor
" autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" Easier to see which tag files are used. One tag file per line
command! TagFiles :call EchoTags()
function! EchoTags()
    echo join(split(&tags, ","), "\n")
endfunction

set cursorline
" set cursorcolumn
" set colorcolumn=80

hi CursorLineNr term=NONE ctermfg=3 gui=bold guifg=Yellow
" hi clear CursorLine
hi CursorLine term=underline cterm=underline gui=underline

nmap <leader>i :set list!<CR>
highlight NonText ctermbg=NONE ctermfg=10
highlight SpecialKey ctermbg=NONE ctermfg=10
highlight EndOfBuffer ctermfg=3 guifg=#268bd2

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" au FileType gitcommit execute "normal! O" | startinsert

if has('gui_running')
  :set guioptions-=m  "remove menu bar
  :set guioptions-=T  "remove toolbar
  :set guioptions-=r  "remove right-hand scroll bar
  :set guioptions-=L  "remove left-hand scroll bar
endif
