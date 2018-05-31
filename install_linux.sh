apt install vim curl stow
apt install xmonad xmobar dmenu rxvt-unicode chromium-browser emacs xscreensaver scrot
apt install git-core git-lfs

apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic test"
sudo apt update
sudo apt install docker-ce docker-compose

sudo usermod -aG docker ${USER}
su - ${USER}

apt install feh
apt install silversearcher-ag

apt install ruby ruby-bundler
apt install rbenv
gem install rubocop

apt install tmux xclip
apt install zsh

apt install deluge
apt install htop tig git-sh ranger

apt install espeak

apt install cmus
apt install autojump

apt install mu4e
apt install isync
apt install libssl-dev
apt install mail-utils
apt install guile-2.0-dev html2text xdg-utils
apt install libwebkitgtk-dev

apt install notify-osd

apt install clojure leiningen
apt install anki
