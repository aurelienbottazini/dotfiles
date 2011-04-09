# Black       0;30     Dark Gray     1;30
# Blue        0;34     Light Blue    1;34
# Green       0;32     Light Green   1;32
# Cyan        0;36     Light Cyan    1;36
# Red         0;31     Light Red     1;31
# Purple      0;35     Light Purple  1;35
# Brown       0;33     Yellow        1;33
# Light Gray  0;37     White         1;37

export PATH=/usr/local/bin:/usr/local/sbin:"${PATH}"
export CDPATH=.:~:~/projects

function git_prompt {
    # exit if we are not in a git repository
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        return 0
    fi

    # if there is any change...
    if ! git diff-index --quiet HEAD --; then
	now=`date +%s`
	last_commit=`git log --pretty=format:'%at' -1`
	seconds_since_last_commit=$((now-last_commit))
	minutes_since_last_commit=$((seconds_since_last_commit/60))

	if [ $minutes_since_last_commit -gt 30 ]; then
            COLOR="\[\033[0;31m\]"
        elif [ $minutes_since_last_commit -gt 10 ]; then
	    COLOR="\[\033[1;33m\]"
        else
            COLOR="\[\033[0;32m\]"
        fi
	right_echo=" $COLOR$minutes_since_last_commit"
    else
	right_echo=" \[\033[0;32m\]✓"
    fi
    echo "\[\033[0;36m\]$(__git_ps1 '(%s)')$right_echo"
}

# brew install bash-completion and brew info bash-completion
# ln "/usr/local/Library/Contributions/brew_bash_completion.sh" "/usr/local/etc/bash_completion.d"
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

PROMPT_COMMAND='PS1="\[\033[0;34m\]\w $(git_prompt)\n\[\033[1;32m\]‣\[\033[0m\] "'

alias o='open . &'		# finder

alias ..='cd ..'   # up one dir

alias a='ls -A' # -A all except literal . ..
alias c='clear'
alias cdd='cd -'  # goto last dir cd'ed from
alias cl='clear; l'
alias cls='clear; ls'
alias h='history'
alias l.='ls -d .[^.]*'
alias l='ls -lhGt'  # -l long listing, most recent first
alias la="ls -A -l -G"
alias lh="ls -lh"
alias ll='ls -lhG'  # -l long listing, human readable, no group info
alias ls='ls -G'
alias lt='ls -lt' # sort with recently modified first

alias g='git status'
alias ga="git add ."
alias gl='git pull'
alias gp='git push'

alias rii='ri -i --no-gem' 	# interactive ri

# Commit pending changes and quote all args as message
function gg() {
    git commit -v -a -m "$*"
}
