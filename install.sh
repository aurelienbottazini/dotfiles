#!/usr/bin/env sh

brew tap Goles/battery
brew install caskroom/cask/brew-cask
brew install Caskroom/cask/xquartz
brew install reattach-to-user-namespace battery fzf coreutils git the_silver_searcher binutils findutils libtool npm tidy-html5 hunspell languagetool
brew install htop rbenv rbenv-ctags
brew install global --with-exuberant-ctags --with-pygments
brew cask install launchrocket
brew install tree
brew install node
brew install hub

brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags
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
npm install -g js-beautify
npm install -g tern
npm install -g bower
npm install -g eslint
npm install -g eslint-plugin-jsx-a11y

npm install -g babel-cli
npm install -g babel-preset-es2015
npm install -g save-dev babel-preset-react
npm install -g babel-preset-stage-0

brew install emacs --srgb ---with-imagemagick --with-librsvg --with-mailutils --with-dbus --with-cocoa
tic -o ~/.terminfo /usr/local/share/emacs/24.5/etc/e/eterm-color.ti
tic -x ~/xterm-256color.terminfo

brew install offlineimap
brew services start offlineimap
EMACS=/Applications/Emacs.app/Contents/MacOS/Emacs brew install mu --with-em
acs --HEAD
brew install gnutls
brew install gnu-sed --with-default-names

gem install gem-ctags
gem install rubocop sass ruby-beautify htmlbeautifier bundler-audit fasterer brakeman mail
gem install rcodetools fastri
gem install dotenv

gem install terminal-notifier

brew install stow

brew tap homebrew/dupes
brew install grep --with-default-names

stow emacs
stow fish
stow git
stow home
stow tmux
stow vagrant
