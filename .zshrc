#!/bin/zsh
##
# aiwenár - .zshrc
#

source ~/.profile

#
# loads
#

autoload colors && colors
autoload -Uz vcs_info
autoload -U compinit && compinit
autoload -U complist

#
# aliases
#

alias "gclone"="git clone"
alias "gpull"="git pull"
alias "gpush"="git push"
alias "ghpl"="gipl origin master"
alias "ghpu"="gipu origin master"
alias "gcom"="git commit"
alias ll='ls -lh'
alias la='ls -lha'

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

#
# battery information (TTYx)
#

source ~/.scripts/battery
check_battery

#
# ninja completion
#

source ~/Documents/sources/ninja/misc/zsh-completion

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

  check_battery

  cursor="%{$prompt%}>%{$resetc%}"
  vcs_info 'prompt'
}

#
# prompt
#

PROMPT='${batts}'"%{$green%}%n%{$resetc%} %{$cursor%}"'${vcs_info_msg_0_}${cursor}'" %{$resetc%}"
RPROMPT="%~"
