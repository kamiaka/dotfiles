#
# Setting Paths
#

# Golang
export GOPATH=$HOME
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# protoc
#   download protobuf-{version}-{platform}.zip from https://github.com/protocolbuffers/protobuf/releases
#   and unzip {file} -d ~/AppData/protoc
export PATH="$HOME/AppData/protoc/bin:$PATH"

# grpc tools
export PATH="$PATH:$HOME/src/github.com/grpc/grpc/bins/opt"

# History size
export HISTSIZE=9999
export HISTCONTROL=ignoredups

# prompt
export PS1="\n\033[32m\u: \w\033[39m\$(git-branch)\033[m \n\$ "

# Set `ls` colors
export LS_COLORS='no=01;37:fi=00:di=01;36:ln=01;32:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;32;01:ex=01;33:*core=01;31:'

# Using `less` with colors
export LESS='-R'

#
# Import
#
if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi

