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

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias l.='ls -d .*'
alias tmux='tmux -u'

alias cljr='clojure -Sdeps "{:deps {com.bhauman/rebel-readline {:mvn/version \"0.1.4\"}}}" -m rebel-readline.main'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias v.="(cd dotfiles &&  vim .)"

alias g="git-status"

# You will need for 24 bits emacs:
# tic -x -o ~/.terminfo ~/dotfiles/emacs/terminfo-24bit.src
alias ec="TERM=xterm-24bit emacsclient -s $(tmux display-message -p '#S') -ta ''"
alias ee="TERM=xterm-24bit emacs -nw"
alias emg="emacs . >/dev/null 0>&2 &; disown $1"

alias whatismyip="dig +short myip.opendns.com @resolver1.opendns.com"
