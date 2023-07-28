#!/bin/bash
cd ~/

# Install dev tools
sudo apt-get update
sudo apt-get install build-essential
sudo apt-get install stow

# Install Neovim Prerequisites
sudo apt-get install ninja-build gettext cmake unzip curl

# Install zsh
sudo apt install zsh
chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


# Stow
mv ~/.zshrc .zshrc.old
cd dotfiles
stow */
cd ~/

cd ~/

# Install Neovim
echo "INSTALLING NEOVIM"
cd ~/
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd ~/

# Install Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Instal Go
# Define the download URL for the latest stable Go version for Linux AMD64
DOWNLOAD_URL=$(curl -s https://golang.org/dl/ | grep -o -m 1 'https://dl.google.com/go/go[0-9.]*.linux-amd64.tar.gz')
# Download and install Go
wget "$DOWNLOAD_URL"
sudo tar -C /usr/local -xzf go$VERSION.linux-amd64.tar.gz
rm go$VERSION.linux-amd64.tar.gz

# Verify installation
go version

# Launch zsh
zsh
nvim
# Install Packer
# might not need to do this 
# see: https://github.com/wbthomason/packer.nvim#bootstrapping
#git clone --depth 1 https://github.com/wbthomason/packer.nvim\
# ~/.local/share/nvim/site/pack/packer/start/packer.nvim
