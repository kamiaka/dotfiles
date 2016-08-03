
# Golang
export GOPATH=$HOME
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi

