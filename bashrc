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

export EDITOR=nvim

export CDPATH=$HOME/go/src/github.com/cozy
export GOPATH=$HOME/go
export GO111MODULE=on
export PATH=$HOME/bin:$HOME/bin/go/bin:$GOPATH/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
source ~/.bash_completions/alacritty
source ~/.bash_completions/tmuxinator
#source ~/.bash_completions/git # until git 2.18 is released to fedora 28

export RBENV_ROOT="${HOME}/.rbenv"
export PATH="${RBENV_ROOT}/bin:${PATH}"
eval "$(rbenv init -)"

export PATH=$HOME/.config/yarn/global/node_modules/.bin:$PATH


alias alacritty="env WAYLAND_DISPLAY= WINIT_HIDPI_FACTOR=1.5 alacritty"
alias dnf="dnf -c ~/dotfiles/dnf.conf"
