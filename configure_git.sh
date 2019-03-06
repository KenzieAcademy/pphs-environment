#!/bin/bash

git-config(){
  hosting=$1
	read -p "$hosting username:" username
  read -p "$hosting email address: "
  read -p "key passphrase: " passphrase
  filename="$HOME/.ssh/$hosting"
  ssh-keygen -t rsa -b 4096 -C "$email" -f "$filename" -N "$passphrase"
  pkill -f ssh-agent
  eval "$(ssh-agent -s)"
  ssh-add $filename
  pbcopy < $filename.pub
  echo 'Chrome is opening. Plese wait for instructions'
  open -a Google\ Chrome "https://github.com/login"
}

git-config github
