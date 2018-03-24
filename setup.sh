#!/bin/sh
pacman -Sy tmux reflector zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
wget -qO- https://raw.githubusercontent.com/rystaf/sandbox/master/nocaps.map | loadkeys
