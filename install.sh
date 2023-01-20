#!/bin/sh

set -ex

sudo apt update

echo "Installing dependencies..."
sudo apt install -y vim powerline fonts-powerline curl

echo "Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing vim plugins..."
vim -es -u ~/.vim/.vimrc -i NONE -c "PlugInstall" -c "qa"

echo "Creating .vimrc symlink..."
ln -sf ~/.vim/.vimrc ~/.vimrc

echo "Done!"
