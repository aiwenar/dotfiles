zstyle ':vcs_info:*:prompt:*'               enable git
zstyle ':vcs_info:*:prompt:*'               check-for-changes true
zstyle ':vcs_info:*:prompt:*' stagedstr     "%{$yellow%}"
zstyle ':vcs_info:*:prompt:*' unstagedstr   "%{$green%}"
zstyle ':vcs_info:*:prompt:*' actionformats "(%{$magenta%}%u%c%b)%{$reset_color%} "
zstyle ':vcs_info:*:prompt:*' formats       "%{$magenta%}%c%u(%c%b%c%u)%{$reset_color%} "
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

  cursor="%{$prompt%}>%{$reset_color%}"
  vcs_info 'prompt'
  batt_info
}

#
# prompt
#

PROMPT='${batt_info_msg}'"%{$green%}%n%{$resetc%} %{$cursor%}"'${vcs_info_msg_0_}${cursor}'" %{$resetc%}"
RPROMPT="%~"

