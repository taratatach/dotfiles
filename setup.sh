#!/bin/sh
DIR="$HOME/dotfiles"

# Link dotfiles
echo "[1] Linking dotfiles"
ln -s $DIR/vim $HOME/.vim
rm $HOME/.bashrc && ln -s $DIR/bashrc $HOME/.bashrc
ln -s $DIR/tigrc $HOME/.tigrc
ln -s $DIR/vimrc $HOME/.vimrc
ln -s $DIR/global-gitconfig $HOME/.gitconfig
ln -s $DIR/global-gitignore $HOME/.gitignore

## VIM ##
echo "[2] Configuring Vim..."
CURRENTDIR=$(pwd)
cd $DIR

# Download Vim plugins
echo "-- Installing plugins"
git submodule init
git submodule update

# Install Vimproc plugin
echo "-- Installing Vimproc"
cd vim/bundle/vimproc.vim/ && make

cd $CURRENTDIR
##     ##

# Install LAFAYETTE layout
echo "[3] Setting up keyboard layout"
export LAYOUT_PATH="$DIR/lafayette.xkb"

