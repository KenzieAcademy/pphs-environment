#!/bin/bash

# Verify Ruby is installed (Installed by default in MacOS)
if [ -x !"$(command -v ruby)" ]; then
  echo 'Ruby is not installed. See instructor.'
  exit 1
fi

# Install Homebrew
if [ ! -x "$(command -v brew)" ]; then
  echo 'Installing brew'
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo 'Updating brew'
  brew update
else
  echo 'Updating brew'
  brew update
fi

# Install Google Chrome
if [ ! -d "/Applications/Google Chrome.app" ]; then
  echo 'Installing Google Chrome'
  brew cask install google-chrome
else
  echo 'Google Chrome is installed'
fi

# Install Visual Studio Code
if [ ! -d "/Applications/Visual Studio Code.app" ]; then
  echo 'Installing Visual Studio Code'
  brew cask install visual-studio-code
else
  echo 'Visual Studio Code is installed.'
fi

# Install git
if [ ! -x "$(command -v git)" ]; then
  brew install git
else
  echo 'git is installed and presumed configured.'
fi

# Install and configure nvm
if [ ! -x "$(command -v nvm)" ]; then
  echo "Installing Node Version Manager."
  brew install nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  nvm install --lts
  nvm alias default 'lts/*'
else
  echo 'Node Version Manager is installed and presumed configured.'
fi
