#!/bin/zsh
##
# aiwenár - .zshrc
#

source ~/.profile

#
# local configuration
#

if [[ -e ~/.localrc ]] ; then
  source ~/.localrc
fi

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

local CORE_COUNT=5 # for make

alias "gclone"="git clone"
alias "gpull"="git pull"
alias "gpush"="git push"
alias "gstat"="git status"
alias "ghpl"="gpull origin master"
alias "ghpu"="gpush origin master"
alias "gcom"="git commit"
alias ll='ls -lh'
alias la='ls -lha'
alias make="make -j $CORE_COUNT"

#
# terminal - dependend stuff
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

#
# colors
#

green=$fg[green]
yellow=$fg[yellow]
red=$fg[red]
magenta=$fg[magenta]
resetc=$reset_color

#
# prompt style
#

zstyle ':vcs_info:*:prompt:*'               enable git
zstyle ':vcs_info:*:prompt:*'               check-for-changes true
zstyle ':vcs_info:*:prompt:*' stagedstr     "%{$yellow%}"
zstyle ':vcs_info:*:prompt:*' unstagedstr   "%{$green%}"
zstyle ':vcs_info:*:prompt:*' actionformats "(%{$magenta%}%u%c%b)%{$resetc%} "
zstyle ':vcs_info:*:prompt:*' formats       "%{$magenta%}%c%u(%c%b%c%u)%{$resetc%} "
zstyle ':vcs_info:*:prompt:*' nvcsformats   ""

zstyle ':batt_info:adapter' color   "$yellow"
zstyle ':batt_info:batt'    level1  "$green"
zstyle ':batt_info:batt'    level2  "$yellow"
zstyle ':batt_info:batt'    level3  "$red"

function precmd {
  local last=$?
  local prompt=""

  if [[ $last -eq 0 ]] ; then
    prompt=$green
  elif [[ $last -eq 1 ]] ; then
    prompt=$yellow
  else
    prompt=$red
  fi

  cursor="%{$prompt%}>%{$resetc%}"
  vcs_info 'prompt'
  batt_info
}

#
# prompt
#

PROMPT='${batt_info_msg}'"%{$green%}%n%{$resetc%} %{$cursor%}"'${vcs_info_msg_0_}${cursor}'" %{$resetc%}"
RPROMPT="%~"
