#!/usr/bin/env sh

brew tap Goles/battery
brew install caskroom/cask/brew-cask
brew install Caskroom/cask/xquartz
brew install reattach-to-user-namespace battery fzf coreutils git the_silver_searcher binutils findutils libtool npm tidy-html5 hunspell languagetool
brew install htop rbenv rbenv-ctags ctags
brew install global --with-exuberant-ctags --with-pygments
brew cask install launchrocket
brew install tree
brew install node
brew install hub

# brew version does not work with ruby pdfkit. Need at least version 0.12.3
# install it using http://wkhtmltopdf.org/downloads.html
# brew install wkhtmltopdf

npm install -g jshint
npm install -g coffeelint
npm install -g grunt-cli
npm install -g livedown
npm install -g typescript
npm install -g tslint
npm install -g less
npm install -g jsxhint
npm install -g eslint
npm install -g js-beautify
npm install -g tern
npm install -g bower
npm install -g eslint-plugin-jsx-a11y
npm install -g babel-cli

brew install emacs
brew install offlineimap
EMACS=/Applications/Emacs.app/Contents/MacOS/Emacs brew install mu --with-em
acs --HEAD
brew install gnutls
brew install gnu-sed --with-default-names

gem install gem-ctags
gem install rubocop sass ruby-beautify htmlbeautifier bundler-audit fasterer brakeman mail
gem install rcodetools fastri
gem install dotenv
brew install docker-machine-parallels

brew install stow

stow emacs
stow fish
stow git
stow home
stow tmux
stow vagrant
