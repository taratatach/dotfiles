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
ln -s $DIR/vim $HOME/.config/nvim
rm $HOME/.bashrc && ln -s $DIR/bashrc $HOME/.bashrc
ln -s $DIR/tigrc $HOME/.tigrc
ln -s $DIR/global-gitconfig $HOME/.gitconfig
ln -s $DIR/global-gitignore $HOME/.gitignore
ln -s $DIR/git-completion.bash $HOME/.git-completion.bash
echo "[1] Done."

## VIM ##
echo "[2] Configuring Vim..."
CURRENTDIR=$(pwd)
cd $DIR

# Install python binding for neovim
echo "-- Installing Neovim python binding"
sudo easy_install pip
sudo pip install neovim

# Download Vim plugins
echo "-- Installing plugins"
git submodule init
git submodule update

# Install Vimproc plugin
#echo "-- Installing Vimproc"
#cd vim/bundle/vimproc.vim/ && make

# Check for presence of xsel to access system clipboard
echo "-- Checking for xsel presence"
# [ command -v xsel ]
sudo dnf install xsel

cd $CURRENTDIR
echo "[2] Done."
##     ##

# Install LAFAYETTE layout
#echo "[3] Setting up keyboard layout..."
#echo "export LAYOUT_PATH=$HOME/dotfiles/lafayette.xkb" >> $HOME/.bashrc
#echo "$HOME/dotfiles/set-keyboard-layout.sh" >> $HOME/.bashrc
#echo "[3] Done."

# Install Alacritty
echo "[4] Installing Alacritty..."
echo "-- Installing latest version of rust"
curl https://sh.rustup.rs -sSf | sh
rustup override set stable
rustup update stable

echo "-- Installing build dependencies"
sudo dnf install cmake freetype-devel fontconfig-devel xclip

echo "-- Downloading Alacritty"
cargo install --git https://github.com/jwilm/alacritty

echo "-- Adding desktop entry"
wget https://raw.githubusercontent.com/jwilm/alacritty/master/alacritty.desktop
desktop-file-install alacritty.desktop --dir=/home/erwan/.local/share/applications
rm alacritty.desktop

echo "-- Installing bash completions"
mkdir -p ~/.bash_completion
cd ~/.bash_completion
wget https://raw.githubusercontent.com/jwilm/alacritty/master/alacritty-completions.bash -O alacritty
echo "source ~/.bash_completion/alacritty" >> ~/.bashrc

echo "[4] Done."
# ##

# Load user config
echo "[5] Loading your configuration..."
. $HOME/.bashrc
echo "[5] Done."

echo "\nSetup done!"
