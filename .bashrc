#!/usr/env bash
alias upgrade="sudo apt-get update;sudo apt-get upgrade -y;"

#Git customization
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

export PATH=$PATH:~/opt/bin

