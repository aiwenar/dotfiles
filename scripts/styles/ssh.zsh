##
# aiwenár - ssh style
#

source "$HOME/.scripts/styles/$_SSH_NORMAL_STYLE.zsh"
PROMPT=`echo $PROMPT | sed 's/%n/(ssh) %n/g'`
