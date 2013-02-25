# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# Use: export ZSH; ./theme_chooser.sh to get a preview of all themes
ZSH_THEME="aure"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export LANG="fr_FR.UTF-8"

alias l.="ls -ld .*"
alias tu="tmux -u"
alias tmux="tmux -u"
alias screen="screen -U"
alias o="open ."
alias ctags="/usr/local/Cellar/ctags/5.8/bin/ctags"

function gg() {
    git commit -v -m "$*"
}
function gga() {
    git commit -v -a -m "$*"
}

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

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

export CDPATH=:$HOME:$HOME/projects
# Customize to your needs...
export PATH=/usr/local/bin:$PATH:/usr/local/share/npm/bin:/usr/local/sbin:$HOME/dotfiles/bin:/usr/local/lib/node_modules:$HOME/node_modules/less/bin:/opt/X11/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
