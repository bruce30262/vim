#!/bin/sh

set -e

sudo apt update

echo "Installing dependencies..."
sudo apt install -y vim curl

echo "Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing vim plugins..."
set +e # disable -e because the followings will return 1 even if all plugins have installed successfully
vim -es -u ~/.vim/.vimrc -i NONE -c "PlugInstall" -c "qa"

set -e
echo "Creating .vimrc symlink..."
ln -sf ~/.vim/.vimrc ~/.vimrc

echo "Done!"
