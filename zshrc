# http://www.zsh.org/
export PATH=/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:~/.gem/ruby/1.8/bin:$PATH:~/bin_and_dotfiles:~/android-sdk-mac_86/tools

setopt promptsubst 		# Expansion for prompt string

autoload -U promptinit		# Loading presintalled themes
promptinit
prompt wunjo

autoload -U compinit		# Completion
compinit


