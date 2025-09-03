#!/usr/bin/env bash

sudo pacman -S tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cargo install tmux-sessionizer

mkdir -p ~/.config/tmux && stow tmux --adopt -t ~
