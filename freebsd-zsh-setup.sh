#!/bin/sh

#
# Set up ZSH and oh-my-zsh
#

pkg install -fy zsh vim curl

echo "INFO: When complete, you may want to prepend 'source ~/.profile' to the new ~/.zshrc."

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /usr/local/bin/zsh root
