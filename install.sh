#!/bin/bash
cd ~/

# Install zsh
sudo apt install zsh
chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


# Install dev tools
sudo apt-get update
sudo apt-get install build-essential
sudo apt-get install stow

mv ~/.zshrc .zshrc.old

cd dotfiles
stow */
cd ~/
# Launch zsh
zsh
# Install Neovim Prerequisites
sudo apt-get install ninja-build gettext cmake unzip curl

cd ~/

# Install Neovim
echo "INSTALLING NEOVIM"
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
nvim
# Install Packer
# might not need to do this 
# see: https://github.com/wbthomason/packer.nvim#bootstrapping
#git clone --depth 1 https://github.com/wbthomason/packer.nvim\
# ~/.local/share/nvim/site/pack/packer/start/packer.nvim
