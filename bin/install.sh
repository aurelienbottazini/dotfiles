#!/usr/bin/env zsh

brew tap Goles/battery
brew install caskroom/cask/brew-cask
brew install Caskroom/cask/xquartz
<<<<<<< Updated upstream
brew install reattach-to-user-namespace battery fzf coreutils git the_silver_searcher binutils findutils libtool npm tidy-html5 hunspell languagetool
brew install htop rbenv rbenv-ctags ctags
brew install unison
brew cask install launchrocket
brew install tree
=======
brew install reattach-to-user-namespace battery fzf coreutils git the_silver_searcher binutils findutils libtool npm tidy-html5 hunspell languagetool wn
brew install htop rbenv rbenv-ctags ctags
>>>>>>> Stashed changes
npm install -g jshint
npm install -g coffeelint
npm install -g grunt-cli
npm -g install instant-markdown-d

export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"

gem install gem-ctags
gem install rubocop sass ruby-beautify htmlbeautifier bundler-audit fasterer brakeman

if ! [ -d "${ZDOTDIR:-$HOME}/.zprezto" ]; then
  git clone --recursive git@github.com:aurelienbottazini/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
fi

# code climate
curl -SLo "jet-0.11.5.tar.gz" "https://s3.amazonaws.com/codeship-jet-releases/0.11.5/jet-darwin_amd64_0.11.5.tar.gz"
tar -xC /usr/local/bin/ -f jet-0.11.5.tar.gz
chmod u+x /usr/local/bin/jet

ln -sf ~/dotfiles/Vagrantfile ~/Vagrantfile
ln -sf ~/dotfiles/Vagrantfile_shell_provision.sh ~/Vagrantfile_shell_provision.sh
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

echo "Set a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 0.02
echo "Set a shorter Delay until key repeat"
defaults write NSGlobalDomain InitialKeyRepeat -int 12
