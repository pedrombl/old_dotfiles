bi() {
  echo Adding to homebrew.sh file
  echo brew install $@ >> ~/.dotfiles/homebrew.sh
  echo Calling homebrew
  brew install $@
}

biall() {
  echo installing everything
  ./~/.dotfiles/homebrew.sh
}

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
