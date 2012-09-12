# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="aure"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export LANG="fr_FR.UTF-8"

alias l.="ls -ld .*"
alias tu="tmux -u"
alias screen="screen -U"
alias o="open ."
alias ctags="/usr/local/Cellar/ctags/5.8/bin/ctags"
alias et="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -t"
alias ec="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c &"
alias ed="/Applications/Emacs.app/Contents/MacOS/Emacs --daemon"

function gg() {
    git commit -v -a -m "$*"
}


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew thor)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:~/dotfiles/bin:/usr/local/lib/node_modules:~/node_modules/less/bin:$PATH
export CDPATH=$HOME:$HOME/projects

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
