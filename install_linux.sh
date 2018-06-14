#!/usr/bin/env sh
#######################################
## packages
#######################################

sudo apt install vim curl stow
sudo apt install xmonad xmobar dmenu rxvt-unicode chromium-browser emacs xscreensaver scrot
sudo apt install git-core git-lfs

sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic test"
sudo apt update
sudo apt install docker-ce docker-compose

sudo usermod -aG docker ${USER}
su - ${USER}

sudo apt install feh
sudo apt install silversearcher-ag

sudo apt install rbenv
rbenv global 2.4.4
sudo gem install rubocop rcodetools fastri

sudo apt install tmux xclip
sudo apt install zsh

sudo apt install deluge
sudo apt install htop tig git-sh ranger

sudo apt install espeak

sudo apt install cmus
sudo apt install autojump

sudo apt install mu4e
sudo apt install isync
sudo apt install libssl-dev
sudo apt install guile-2.0-dev html2text xdg-utils
sudo apt install libxapian-dev libgmime-2.6-dev libwebkitgtk-3.0-dev

sudo apt install notify-osd

sudo apt install clojure leiningen
sudo apt install anki
sudo apt install ubuntu-restricted-extras
sudo apt install python-pip

sudo apt install awscli

sudo apt install fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fisher edc/bass

# for emacs compilation
sudo apt install texinfo libgnutls28-dev libxpm-dev libjpeg-dev libgif-dev libtiff-dev mailutils

# wifi tools -> interferes with default ubuntu tool
# sudo apt install wicd-gtk wicd-cli

sudo apt install vlc

sudo apt install webalizer

sudo apt install hunspell hunspell-fr-modern hunspell-en-us

sudo apt install tree kazam flameshot

# for perf
sudo apt install linux-common-tools linux-tools-4.15.0-22-generic

# twitter
sudo apt install corebird


#######################################
## Compile from source
#######################################

mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install v8.11.1

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ranger --copy-config=scope

cd ~/Downloads
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
sudo dpkg -i ./ripgrep_0.8.1_amd64.deb

cd ~/projects
git clone git://git.suckless.org/st
git clone https://git.suckless.org/dmenu

cd ~/projects
git clone -b master git://git.sv.gnu.org/emacs.git
git checkout -b 26.1 emacs-26.1

cd ~/projects
curl -OL hhttps://github.com/djcb/mu/archive/v1.0.tar.gz
tar -zxf mu-1.0
rm v1.0.tar.gz
cd ./mu-1.0
./autogen.sh
sudo make install

git clone https://github.com/Ventto/lux.git
cd lux
sudo make install
