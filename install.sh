#!/bin/bash
cd ~/

# Install dev tools
sudo apt-get update
sudo apt-get install build-essential
sudo apt-get install stow

# Install Neovim Prerequisites
sudo apt-get install ninja-build gettext cmake unzip curl

# Install ripgrep
sudo apt-get install ripgrep

# Install zsh
#sudo apt install zsh
#chsh -s $(which zsh)

# Install oh-my-zsh
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

#git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


# Stow
#mv ~/.zshrc .zshrc.old
#cd dotfiles
#stow */
#cd ~/
#install Make
sudo apt install make

# Install Neovim
echo "INSTALLING NEOVIM"
cd ~/
mkdir build
cd build
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd ~/

# Install Packer
#git clone --depth 1 https://github.com/wbthomason/packer.nvim\
# ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install Go
# Define the download URL for the latest stable Go version for Linux AMD64

# Define the download URL for the latest stable Go version for Linux AMD64
DOWNLOAD_URL="https://go.dev/$(curl -s https://go.dev/dl/ | grep -o -m 1 'dl/go[0-9.]*.linux-amd64.tar.gz')"
echo $DOWNLOAD_URL

# Extract the version number from the download URL
VERSION=$(echo "$DOWNLOAD_URL" | grep -o -m 1 'go[0-9.]*.linux-amd64.tar.gz' | cut -c 3- | rev | cut -c 20- | rev)
echo $VERSION
echo "go$VERSION.linux-amd64.tar.gz"

# Download the Go package
wget "$DOWNLOAD_URL"

# Install Go
# need to add checking for existing go directory
# and removing first if it exists
sudo tar -C /usr/local -xzf go$VERSION.linux-amd64.tar.gz
rm go$VERSION.linux-amd64.tar.gz

# Set Go environment variables
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.profile
echo "export GOPATH=\$HOME/go" >> ~/.profile
#source ~/.profile

# Verify the installation
go version


# install clang
# this takes a long time
# should have an if check here with a flag option to determine
# if I want to build clang at the time or not
#cd ~/
#mkdir build
#cd build
#git clone --depth=1 https://github.com/llvm/llvm-project.git
#cd llvm-project

#mkdir build
#cd build

# build llvm and clang in release mode
#cmake -DLLVM_ENABLE_PROJECTS=clang -DCMAKE_BUILD_TYPE=Release -G "Unix Makefiles" ../llvm

#make

# Launch zsh
#zsh
#nvim
# Install Packer
# might not need to do this 
# see: https://github.com/wbthomason/packer.nvim#bootstrapping
#git clone --depth 1 https://github.com/wbthomason/packer.nvim\
# ~/.local/share/nvim/site/pack/packer/start/packer.nvim
