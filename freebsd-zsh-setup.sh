#!/bin/sh

#
# Set up ZSH and oh-my-zsh
#

pkg install -fy zsh curl
chsh -s /usr/local/bin/zsh root
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "INFO: You may want to prepend 'source ~/.profile' to the new ~/.zshrc."
