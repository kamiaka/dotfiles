#!/bin/sh

repo_dir=$(cd $(dirname $0);pwd)

dot_files=".bash_profile .bashrc .vimrc .gitconfig .gitignore_global"
dot_dirs=".ssh"

for f in $dot_files; do
  ln -sf "$repo_dir/$f" ~
done

