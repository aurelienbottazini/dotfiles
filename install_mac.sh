#!/usr/bin/env sh

brew tap Goles/battery
brew install caskroom/cask/brew-cask
brew install Caskroom/cask/xquartz
brew install reattach-to-user-namespace battery fzf coreutils git the_silver_searcher binutils findutils libtool npm tidy-html5 aspell languagetool
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags


brew install htop rbenv rbenv-ctags
brew install global --with-ctags --with-pygments
brew install mc
brew install ranger
brew tap thoughtbot/formulae
brew install gitsh

brew cask install launchrocket

brew install jump
brew install tree
brew install node
brew install ag
brew install hub
brew install vim
brew install ifstat
brew install ngrep
brew install emacs --with-imagemagick@6 --devel --with-mailutils
brew install elm-format
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

# brew install emacs --srgb ---with-imagemagick --with-librsvg --with-mailutils --with-dbus --with-cocoa
# tic -o ~/.terminfo /usr/local/share/emacs/24.5/etc/e/eterm-color.ti
# tic -x ~/xterm-256color.terminfo
brew tap railwaycat/emacsmacport
brew install emacs-mac
brew linkapps emacs-mac

brew install isync
brew services start isync
brew install mu --with-emacs
brew install w3m
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
