# The purpose of .zshenv is to set up your environment during zsh
# sessions. Many people solely use .zshrc for this purpose, but it is
# useful to destinguish between those files.

# .zshenv is being sourced in every zsh session, while .zshrc is only
# used in interactive sessions, i.e. when you open a shell on your
# computer.

fpath=($fpath $HOME/.zsh/func)
typeset -U fpath