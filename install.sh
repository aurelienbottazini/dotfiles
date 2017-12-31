#!/usr/bin/env sh

brew tap Goles/battery
brew install caskroom/cask/brew-cask
brew install Caskroom/cask/xquartz
brew install reattach-to-user-namespace battery fzf coreutils git the_silver_searcher binutils findutils libtool npm tidy-html5 aspell languagetool
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags

brew install htop rbenv rbenv-ctags
brew install global --with-ctags --with-pygments
brew install ranger

brew cask install launchrocket

brew install tree
brew install node
brew install hub
brew install vim
brew install ifstat
brew install ngrep
brew install elm-format
brew install Emacs --with-cocoa --with-imagemagick@6
ln -sf /usr/local/bin/elm-format-0.18  /usr/local/bin/elm-format
brew install fish
brew install tmux
brew install mobile-shell
brew install ripgrep
brew install wordnet

# brew version does not work with ruby pdfkit. Need at least version 0.12.3
# install it using http://wkhtmltopdf.org/downloads.html
# brew install wkhtmltopdf

brew install yarn
yarn global add elm elm-test elm-css elm-live@2.6.1
yarn global add jshint
yarn global add coffeelint
yarn global add grunt-cli
yarn global add livedown
yarn global add typescript
yarn global add tslint
yarn global add less
yarn global add jsxhint
yarn global add js-beautify
yarn global add tern
yarn global add bower
yarn global add eslint
yarn global add eslint-plugin-jsx-a11y
yarn global add prettier
yarn global add import-js

yarn global add babel-cli
yarn global add babel-preset-es2015
yarn global add save-dev babel-preset-react
yarn global add babel-preset-stage-0

# brew install emacs --srgb ---with-imagemagick --with-librsvg --with-mailutils --with-dbus --with-cocoa
# tic -o ~/.terminfo /usr/local/share/emacs/24.5/etc/e/eterm-color.ti
# tic -x ~/xterm-256color.terminfo
brew tap railwaycat/emacsmacport
brew install emacs-mac
brew linkapps emacs-mac

brew install offlineimap
brew services start offlineimap
EMACS=/Applications/Emacs.app/Contents/MacOS/Emacs brew install mu --with-em
acs --HEAD
brew install gnutls
brew install gnu-sed --with-default-names
brew install clisp

gem install gem-ctags
gem install rubocop sass ruby-beautify htmlbeautifier bundler-audit fasterer brakeman mail
gem install rcodetools fastri
gem install dotenv

gem install terminal-notifier

brew install stow
brew install exiftool

brew tap homebrew/dupes
brew install grep --with-default-names

stow emacs
stow fish
stow git
stow home
stow tmux
stow vagrant
stow dictionaries
