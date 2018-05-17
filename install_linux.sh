apt install xmonad dmenu rxvt-unicode chromium-browser emacs xscreensaver scrot
apt install git-core git-lfs

sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic test"
sudo apt update
sudo apt install docker-ce docker-compose

sudo usermod -aG docker ${USER}
su - ${USER}

apt install feh
apt install mu4e
apt install silversearcher-ag
apt install ruby ruby-bundler
apt install rbenv
gem install rubocop

apt install tmux xclip
apt install zsh

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install v8.11.1

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


apt install deluge
apt install htop tig git-sh ranger
ranger --copy-config=scope

apt install espeak

cd ~/Downloads
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
dpkg -i ./ripgrep_0.8.1_amd64.deb
