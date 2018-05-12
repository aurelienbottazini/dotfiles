apt install xmonad dmenu rxvt-unicode chromium-browser emacs xscreensaver
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

apt install tmux
