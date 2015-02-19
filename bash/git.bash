#!/usr/bin/env bash

source ~/.dotfiles/bash/git-completion.bash
alias g='git'
alias gco='git checkout'
alias gst='git status'
alias gsr='git svn rebase'
alias gsd='git svn dcommit'

function gitchanged() {
  git log --oneline --grep="$@" --name-only | grep -Eo "\w+/.*\.\w+" | sort -u
}

tiggrep() {
  tig --grep="$@" --reverse --oneline
}
