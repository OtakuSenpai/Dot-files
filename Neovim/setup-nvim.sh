#!/bin/sh

mkdir ~/.config/nvim/

cp .config/init.vim ~/.config/nvim/
cp -R .config/colors/ ~/.config/nvim/

curl -fLo ~/.vim/autoload/plug.vim \
             https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Done setting up...run ':PlugInstall' inside Neovim"