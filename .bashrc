
#
function git-branch {
  local branch="$( git branch --no-color 2>/dev/null | sed -ne "s/^\* \(.*\)$/\1/p" )"
  if [ ! -z "$branch" ] ; then
    echo -e " (\033[31m$branch\033[m)"
  fi
}

# cd repository dir
function gg {
  local dir="$( ls -1d $GOPATH/src/*/*/* | peco )"
  if [ ! -z "$dir" ] ; then
   cd "$dir"
  fi
}

# Open network windows path
function fs {
  open "$HOME/Mounts/$( echo $1 | sed s/^\\\\\\\\// | sed s/\\\\/\\//g )"
}


# bash
export PS1="\033[32m\u: \w\033[39m\$(git-branch)\033[m \n\$ "

# ls ---------------------------
export LS_COLORS='no=01;37:fi=00:di=01;36:ln=01;32:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;32;01:ex=01;33:*core=01;31:'
alias ls='ls -G'
alias ll='ls -l'

alias ssh-euc='cocot -t UTF-8 -p EUC-JP ssh'

