#!/usr/env bash
alias upgrade="sudo apt-get update;sudo apt-get upgrade -y;"
alias get="sudo apt-get install -y"

#Git customization
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.unstage 'reset HEAD --'

export PATH=$PATH:~/opt/bin

