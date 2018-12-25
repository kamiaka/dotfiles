#!/bin/sh

# Exit when error occurred.
set -e

# This script is quick setup via:
#  $ curl -fsSL https://github.com/kamiaka/dotfiles/setup.sh
#  $ sh setup.sh

src="$HOME/src"

function __title ()
{
  cat << EOT

#################################################
Setup $1
#################################################

EOT
}

function __clone ()
{
  dir=$2
  if [ "$dir" = "" ]; then
    dir="$HOME/src/${1//://}"
  fi
  
  if [ ! -d $dir ]; then
    url=git@$1.git

    # replace git@github.com/org/repo.git to git@github.com:org/repo.git
    if [[ ! $url == *:* ]]; then
      url=${url/\//:}
    fi

    echo clone $url to $dir

    mkdir -p $dir
    git clone $url $dir
  fi

  echo $dir
}

# Setup doftiles
__title "dotfiles"

dir=`__clone github.com/kamiaka/dotfiles`

dot_files=".bash_profile .bashrc .vimrc .gitconfig .gitignore_global .tmux.conf"

for f in $dot_files; do
  if [ ! -f ~/$f ]; then
    ln -s "$dir/$f" ~
  fi
done


# Setup temrminal colors
__title "terminal colors"

__clone github.com/stephenway/monokai.terminal > /dev/null


# Setup Vundle Vim.
__title "Vundle Vim"

__clone github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim >> /dev/null

vim +PluginInstall +qall


# Setup golang
__title "Golang"

if !(which go > /dev/null 2>&1); then
  version=$(curl -s https://latest-go.appspot.com/)
  filename=go${version}.darwin-amd64.tar.gz
  url=https://dl.google.com/go/${filename}
  
  curl -L -o ~/Downloads/$filename $url
  tar xf ~/Downloads/$filename -C /usr/local
fi


# Setup completions.

__title "git-completion"

if [ ! -f ~/.git-completion.bash ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/.git-completion.bash
fi

__title "npx-completion"

fi [ ! -f ~/.npx-completion.bash ]; then
  curl https://raw.githubusercontent.com/kamiaka/bash-completion/master/npx-completion.bash > ~/.npx-completion.bash
fi


echo "\ndone setup."

# Reload config.
exec $SHELL -l


