#
# Functions
#

# Show git branch
function git-branch {
  local branch="$( git branch --no-color 2>/dev/null | sed -ne "s/^\* \(.*\)$/\1/p" )"
  if [ ! -z "$branch" ] ; then
    echo -e " (\033[31m$branch\033[m)"
  fi
}


# Go to repository dir
function gg {
  local dir="$( ls -1d $GOPATH/src/{github.*/*/*,tmp/*} | peco )"
  if [ ! -z "$dir" ] ; then
   cd "$dir"
  fi
}

# Open repository directory in VSCode
function cc {
  local dir="$( ls -1d $GOPATH/src/{github.*/*/*,tmp/*} | peco )"
  if [ ! -z "$dir" ] ; then
   code "$dir"
  fi
}

# Open network windows path
function fs {
  open "$HOME/Mounts/$( echo $1 | sed s/^\\\\\\\\// | sed s/\\\\/\\//g )"
}


#
# Setting variables
#

# History size
export HISTSIZE=9999
export HISTCONTROL=ignoredups

# prompt
export PS1="\033[32m\u: \w\033[39m\$(git-branch)\033[m \n\$ "

# Set `ls` colors
export LS_COLORS='no=01;37:fi=00:di=01;36:ln=01;32:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;32;01:ex=01;33:*core=01;31:'

# Using `less` with colors
export LESS='-R'

#
# Aliases
#

# ls with color
alias ls='ls -G'

# ls long format (file type, permission, owner and more...)
alias ll='ls -l'

# diff using unified format and using colordiff
if [ -x `which colordiff` ]; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

# using EUC-JP on ssh
alias ssh-euc='cocot -t UTF-8 -p EUC-JP ssh'

#
# Completions
# 

# git
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

