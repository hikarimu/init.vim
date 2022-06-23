#!/bin/bash  

#Install Git 
apt-get update
apt-get -y install git

#Build and install neovim from source for Ubuntu or Debian

##Install build prerequisites
apt-get -y install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen

##Clone neovim
git clone https://github.com/neovim/neovim

##Build neovim with cmake
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo

##Install neovim
make install

#Clean Up
## delete neovim clone 
cd ..
rm -R neovim


#Install Plug Vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#Install ripgrep
apt-get -y install ripgrep

#Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
