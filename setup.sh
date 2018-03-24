#!/bin/sh
pacman -Syy --noconfirm reflector
reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syy  --noconfirm zsh lm_sensors tmux
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
wget -qO- https://raw.githubusercontent.com/rystaf/sandbox/master/nocaps.map | loadkeys
