# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

alias v.="cd dotfiles &&  vim ."

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias l.='ls -d .*'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local

export EDITOR="vim"
export VISUAL="vim"

alias g="git-status"
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
      || complete -o default -o nospace -F _git g

export PATH=~/bin:~/bin/DataGrip/bin:~/.config/yarn/global/node_modules/.bin:~/.cabal/bin:~/dotfiles/bin/:/usr/local/sbin:/usr/local/opt/go/libexec/bin:~/Library/Python/3.6/bin:~/idea-IU/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH

export CDPATH=.:~/:~/projects:~/work

source ~/.git-completion.bash
source ~/.git-prompt.sh
export PROMPT_COMMAND=""
export PS1='\[\e[34;4;3;1m\]\w\[\e[0m\]\[\e[35;1m\]$(__git_ps1 " (%s)")\n\[\e[0m\]\[\e[31;1m\]\$\[\e[0m\] '

[ -f ~/work/dox-compose/bin/dox-init ] && eval "$(~/work/dox-compose/bin/dox-init)"
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
[ -f /usr/share/bash-completion/completions/fzf-key-bindings ] && source /usr/share/bash-completion/completions/fzf-key-bindings
[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /usr/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion
[ -f /usr/share/git/completion/git-completion.bash ] && source /usr/share/git/completion/git-completion.bash
[ -f /usr/share/autojump/autojump.bash ] && source /usr/share/autojump/autojump.bash


_gen_fzf_default_opts() {
  local base03="234"
  local base02="235"
  local base01="240"
  local base00="241"
  local base0="244"
  local base1="245"
  local base2="254"
  local base3="230"
  local yellow="136"
  local orange="166"
  local red="160"
  local magenta="125"
  local violet="61"
  local blue="33"
  local cyan="37"
  local green="64"

  # Comment and uncomment below for the light theme.

  # Solarized Dark color scheme for fzf
  export FZF_DEFAULT_OPTS="--color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue,info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
  "
  ## Solarized Light color scheme for fzf
  #export FZF_DEFAULT_OPTS="
  #  --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
  #  --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
  #"
}
_gen_fzf_default_opts

export XDG_CURRENT_DESKTOP=gnome
export GTAGSLABEL=pygments
export XDG_CURRENT_DESKTOP=GNOME # for gnome-control-center to work correctly on xmonad
export CHROME_BIN=/usr/bin/chromium-browser # for karmajs specs
export NNN_CONTEXT_COLORS='5173'
export NNN_BMS='d:~/Dropbox;p:~/projects/;f:/media/aurelienbottazini/Files;.:~/dotfiles'
export MC_SKIN="$HOME/.config/mc/solarized.ini"
export XDG_CONFIG_HOME="$HOME/.config"
export GIT_TEMPLATE_DIR="$HOME/.git_template"

eval "$("/home/auray/work/dox-compose/bin/dox-init")"
export PATH=$PATH:/home/auray/.rbenv/bin:/home/linuxbrew/.linuxbrew/bin
eval "$(rbenv init -)"

[ -z "$TMUX" ] && [ "$TERM" != "dumb" ] && [ -z "$INSIDE_EMACS" ] && ! shopt -q login_shell && tat

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
