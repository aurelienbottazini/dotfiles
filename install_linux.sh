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

apt install rbenv
rbenv global 2.4.4
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
apt install ubuntu-restricted-extras
apt install python-pip

apt install awscli

apt install fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
ficher edc/bass

# for emacs compilation
apt install texinfo libgnutls28-dev libxpm-dev libjpeg-dev libgif-dev libtiff-dev mailutils

# wifi tools
apt install wicd-gtk wicd-cli

apt install vlc
