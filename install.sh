#!/usr/bin/env zsh

brew tap Goles/battery
brew install caskroom/cask/brew-cask
brew install Caskroom/cask/xquartz
brew install reattach-to-user-namespace battery fzf coreutils git the_silver_searcher binutils findutils libtool npm tidy-html5 hunspell languagetool
brew install htop rbenv rbenv-ctags ctags
brew install global --with-exuberant-ctags --with-pygments
brew install unison
brew cask install launchrocket
brew install tree
brew install node
npm install -g jshint
npm install -g coffeelint
npm install -g grunt-cli
npm install -g instant-markdown-d

export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"

gem install gem-ctags
gem install rubocop sass ruby-beautify htmlbeautifier bundler-audit fasterer brakeman

brew install stow
stow emacs
stow fish
stow git
stow home
stow tmux
stow vagrant
