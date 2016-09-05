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

# for org-babel
npm install --save-dev babel-cli
npm install --save-dev babel-preset-es2015
npm install --save-dev babel-preset-stage-0
npm install --save-dev babel-preset-stage-1
npm install --save-dev babel-preset-stage-2
npm install --save-dev babel-preset-stage-3
npm install --save-dev babel-preset-react

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

brew tap thoughtbot/formulae
brew install gitsh

stow emacs
stow fish
stow git
stow home
stow tmux
stow vagrant
