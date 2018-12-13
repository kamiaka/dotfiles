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

