#!/usr/bin/env bash

if ! (dpkg --get-selections | grep software-properties-common) &> /dev/null; then
  # Make sure add-apt-repository command is available
  sudo apt-get install -y software-properties-common
fi

if ! type "vim.nox" &> /dev/null; then
  sudo add-apt-repository -y ppa:pi-rho/dev # latest vim
  sudo apt-get update
  sudo apt-get install -y vim-nox silversearcher-ag curl
fi

if ! type "git" &> /dev/null; then
  sudo add-apt-repository ppa:git-core/ppa
  sudo apt-get update
  sudo apt-get install -y git
  git config --global url."https://github.com/".insteadOf git@github.com:
  git config --global url."https://".insteadOf git://
fi

if ! type "zsh" &> /dev/null; then
  sudo apt-get install -y zsh
  sudo chsh -s /bin/zsh vagrant
fi

if ! type "docker" &> /dev/null; then
  sudo wget -qO- https://get.docker.com/ | sh
  sudo usermod -aG docker vagrant

  # I want to access docker from outside of the vagrant box
  # for docker using systemctl (ubuntu 15.04 and up)
  sudo sed -i.bak 's/docker daemon/docker daemon -H 0.0.0.0:2375/' /lib/systemd/system/docker.service
  sudo systemctl daemon-reload
  sudo systemctl restart docker
  # for docker using upstart
  sudo sed -i.bak 's/#DOCKER_OPTS=.*/DOCKER_OPTS="-H 0.0.0.0:2375 -H unix:///var/run/docker.sock"/' /etc/default/docker
  sudo restart docker
fi

if ! type "docker-compose" &> /dev/null; then
  sudo wget https://github.com/docker/compose/releases/download/1.4.0/docker-compose-`uname -s`-`uname -m` -O /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
fi

if ! [ -d "${ZDOTDIR:-$HOME}/.zprezto" ]; then
  git clone --recursive git@github.com:aurelienbottazini/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/*; do
    if [ `basename ${rcfile}` == 'README.md' ]; then
      continue;
    fi
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.`basename ${rcfile}`"
  done
fi

