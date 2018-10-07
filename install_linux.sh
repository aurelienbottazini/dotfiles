#!/usr/bin/env sh
# I use gnome-tweaks to change special keys.
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
gem install solargraph
# for sponge, this is to work with xmpfilter and mimic in place editing.
sudo apt install moreutils

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
sudo apt install anki mplayer
sudo apt install ubuntu-restricted-extras
sudo apt install python-pip

sudo apt install awscli

sudo apt install fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fisher edc/bass

sudo add-apt-repository ppa:mkropat/ppa
sudo apt-get install jumpapp

# for emacs compilation
sudo apt install texinfo libgnutls28-dev libxpm-dev libjpeg-dev libgif-dev libtiff-dev mailutils

# wifi tools -> interferes with default ubuntu tool
# sudo apt install wicd-gtk wicd-cli

sudo apt install vlc

sudo apt install webalizer

sudo apt install hunspell hunspell-fr-modern hunspell-en-us

sudo apt install tree
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt-get update
sudo apt-get install obs-studio

# gif recording
sudo add-apt-repository ppa:peek-developers/stable
sudo apt-get update
sudo apt instal peek

# for perf
sudo apt install linux-common-tools linux-tools-4.15.0-22-generic

# twitter
sudo apt install corebird
mkdir -p ~/Pictures/Screenshots


# I have some segfault problem with dmenu compiled from git. The version from apt does not have this problem.
# git clone https://git.suckless.org/dmenu
sudo apt install suckless-tools

# command i have in my shortcuts to run dmenu
# dmenu_run -fn "Gotham HTF Black:size=13" -nb "#fff166" -nf "#000000" -sb "#fccf61" -sf "#000000"

sudo apt install golang


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

mkdir ~/.quokka

cd ~/projects
git clone git@github.com:lupoDharkael/flameshot.git
cd flameshot
sudo apt install qt5-qmake qt5-default qttools5-dev-tools
qmake
make
sudo make install

curl https://sh.rustup.rs -sSf | sh

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
fisher fzf

sudo snap install skype

# terminal
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
# Create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in
# your PATH)
ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications
# Update the path to the kitty icon in the kitty.desktop file
sed -i "s/Icon\=kitty/Icon\=\/home\/$USER\/.local\/kitty.app\/share\/icons\/hicolor\/256x256\/apps\/kitty.png/g" ~/.local/share/applications/kitty.desktop

# imageoptim
sudo apt-get install trimage
