# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
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
