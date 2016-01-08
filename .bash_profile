
# Golang
export GOPATH=$HOME
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

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
bind -x '"\C-]": gg'

if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi
