#!/bin/sh
DIR="$HOME/dotfiles"

if [ -f $HOME/.setup-done ];
then
  echo "Your computer is already set up. Doing nothing.";
  exit;
fi

echo "Setting up your computer..."

# Link dotfiles
echo "[1] Linking dotfiles..."
ln -s $DIR/vim $HOME/.vim
rm $HOME/.bashrc && ln -s $DIR/bashrc $HOME/.bashrc
ln -s $DIR/tigrc $HOME/.tigrc
ln -s $DIR/vimrc $HOME/.vimrc
ln -s $DIR/global-gitconfig $HOME/.gitconfig
ln -s $DIR/global-gitignore $HOME/.gitignore
echo "[1] Done."

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
echo "[2] Done."
##     ##

# Install LAFAYETTE layout
echo "[3] Setting up keyboard layout..."
echo "export LAYOUT_PATH=$HOME/dotfiles/lafayette.xkb" >> $HOME/.bashrc
echo "$HOME/dotfiles/set-keyboard-layout.sh" >> $HOME/.bashrc
echo "[3] Done."

# Load user config
echo "[4] Loading your configuration..."
. $HOME/.bashrc
echo "[4] Done."

echo "\nSetup done!"
