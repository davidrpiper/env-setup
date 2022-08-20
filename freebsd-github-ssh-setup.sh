#!/bin/sh
#
# Need to transfer files to a VM? Try:
#     nc -k -l 8080 > file.txt
#     curl -X POST <ip>:8080 --data-binary @<filename>
#
# Need to get the SSH key out of the VM? Try:
#     python3 -m http.server
#

#
# Download and install dev environment dependencies.
#

pkg bootstrap -yf && pkg update
pkg install -fy git

#
# Setup SSH key. This will require manual steps to connect to Github.
#

ssh-keygen -f ~/.ssh/id_github -N "" -t ed25519 -C "dpiper.public@gmail.com"
eval "$(ssh-agent -s)"
touch ~/.ssh/config

cat >> ~/.ssh/config <<'EOF'
Host *
  AddKeysToAgent yes
  IdentityFile ~/.ssh/id_github

EOF

ssh-add ~/.ssh/id_github

#
# Test SSH connection (will fail until linked on Github)
#

ssh -T git@github.com
