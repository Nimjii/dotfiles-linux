#!/usr/bin/env bash

yay -S hyprland-git
sudo pacman -S wl-clip-persist
sudo pacman -S wl-clipboard

stow hyprland --adopt -t ~
