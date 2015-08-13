#!/usr/bin/env zsh

brew tap Goles/battery
brew install caskroom/cask/brew-cask
brew install Caskroom/cask/xquartz
brew install reattach-to-user-namespace battery fzf coreutils git the_silver_searcher binutils findutils libtool npm tidy-html5 hunspell languagetool wn
brew install htop
npm install -g jshint
npm install -g coffeelint
npm install -g grunt-cli

gem install rubocop sass ruby-beautify htmlbeautifier

# git clone --recursive git@github.com:aurelienbottazini/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# setopt EXTENDED_GLOB
# for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  # ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
# done

ln -sf ~/dotfiles/Vagrantfile ~/Vagrantfile
ln -sf ~/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/screenrc ~/.screenrc
ln -sf ~/dotfiles/rspec ~/.rspec
ln -sf ~/dotfiles/autotest ~/.autotest
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/dictionaries/en_US.aff ~/Library/Spelling/en_US_aurelien.aff
ln -sf ~/dotfiles/dictionaries/en_US.dic ~/Library/Spelling/en_US_aurelien.dic
ln -sf ~/dotfiles/dictionaries/fr_FR.aff ~/Library/Spelling/fr_FR.aff
ln -sf ~/dotfiles/dictionaries/fr_FR.dic ~/Library/Spelling/fr_FR.dic
ln -sf ~/dotfiles/dictionaries/fr_FR.aff ~/Library/Spelling/fr_FR_aurelien.aff
ln -sf ~/dotfiles/dictionaries/fr_FR.dic ~/Library/Spelling/fr_FR_aurelien.dic
ln -sf ~/dotfiles/dictionaries/.hunspell_en_US_aurelien ~/.hunspell_en_US_aurelien
ln -sf ~/dotfiles/dictionaries/.hunspell_fr_FR_aurelien ~/.hunspell_fr_FR_aurelien
ln -sf ~/dotfiles/tmuxinator ~/.tmuxinator
ln -sf ~/dotfiles/agignore ~/.agignore
ln -sf ~/dotfiles/vimrc ~/.vimrc
