#!/usr/bin/env bash

sudo pacman -S --needed tree-sitter
sudo pacman -S --needed bob
sudo pacman -S --needed ripgrep
sudo pacman -S --needed fzf

bob install latest && bob use latest

stow nvim --adopt -t ~
