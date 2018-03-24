#!/bin/sh
pacman -Syy --noconfirm reflector
reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syy  --noconfirm zsh lm_sensors tmux
curl https://raw.githubusercontent.com/rystaf/sandbox/master/nocaps.map | loadkeys
