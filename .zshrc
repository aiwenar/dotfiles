#!/bin/zsh
##
# aiwenár - .zshrc
#

bindkey -e
source ~/.profile

#
# local configuration
#

if [[ -e ~/.localrc ]] ; then
  source ~/.localrc
fi

#
# python startup file
#

export PYTHONSTARTUP="/home/$USER/.startup.py"

#
# loads
#

autoload colors && colors
autoload -Uz vcs_info
autoload -U compinit && compinit
autoload -U complist
autoload -U zmv # zsh mv - mv with regex

#
# aliases
#

# not override if defined in .localrc
(( ! $#MAKE_TASKS_COUNT )) && MAKE_TASKS_COUNT=1

alias "gclone"="git clone"
alias "gpull"="git pull"
alias "gpush"="git push"
alias "gstat"="git status"
alias "ghpl"="gpull origin master"
alias "ghpu"="gpush origin master"
alias "gcom"="git commit"
alias ls='ls --color'
alias ll='ls -lh'
alias la='ls -lha'
alias grep='grep --colour=auto'
alias make="make -j $MAKE_TASKS_COUNT"

#
# terminal-dependend stuff
#

if [[ -e ~/.scripts/terminals/$TERM ]] source ~/.scripts/terminals/$TERM

#
# history
#

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

#
# options
#

setopt notify
setopt prompt_subst
setopt correct
setopt hist_reduce_blanks
setopt complete_in_word
setopt multios            # multiple redirections
# setopt sharehistory

#
# colors
#

green=$fg[green]
yellow=$fg[yellow]
red=$fg[red]
magenta=$fg[magenta]

#
# various scripts
#

function loadext ()
{
  if [[ -e $1 ]] ; then
    source $1
  fi
}

loadext ~/.scripts/battery     # battery state (TTYx)
loadext ~/.scripts/completion  # load completion files from ~/.scripts/completion.d
loadext ~/.scripts/functions   # misc functions
loadext ~/.scripts/ssh
loadext ~/.scripts/zshstyle
loadext ~/.scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

