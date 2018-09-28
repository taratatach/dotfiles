# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source global definitions
if [ -f "$HOME/.bash_aliases" ]; then
	. "$HOME/.bash_aliases"
fi

# Source git bash completion
if [ -f "$HOME/.git-completion.bash" ]; then
        . "$HOME/.git-completion.bash"
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
[ -r /home/erwan/.byobu/prompt ] && . /home/erwan/.byobu/prompt   #byobu-prompt#

# Don't use PROMPT_COMMAND within Byobu to keep window names
# http://stackoverflow.com/a/32150189
if [ ! -z $BYOBU_RUN_DIR ];
then
  unset PROMPT_COMMAND
fi
export LAYOUT_PATH=/home/erwan/dotfiles/lafayette.xkb
/home/erwan/dotfiles/set-keyboard-layout.sh

export PATH=$HOME/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
