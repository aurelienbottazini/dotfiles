#!/usr/bin/env zsh

sudo apt-get install -y software-properties-common 
sudo add-apt-repository -y ppa:pi-rho/dev
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y vim-nox npm silversearcher-ag zsh git curl tmux
sudo chsh -s /bin/zsh vagrant
sudo wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker vagrant
sudo wget https://github.com/docker/compose/releases/download/1.4.0/docker-compose-`uname -s`-`uname -m` -O /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo sed -i.bak 's/docker daemon/docker daemon -H 0.0.0.0:2375/' /lib/systemd/system/docker.service
sudo systemctl daemon-reload
sudo systemctl restart docker

git config --global url."https://github.com/".insteadOf git@github.com:
git config --global url."https://".insteadOf git://

if ! [ -d "${ZDOTDIR:-$HOME}/.zprezto" ]; then
  git clone --recursive git@github.com:aurelienbottazini/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
fi

