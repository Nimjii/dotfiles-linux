#!/usr/bin/env bash

sudo pacman -S --needed tree-sitter
sudo pacman -S --needed bob
sudo pacman -S --needed ripgrep
sudo pacman -S --needed fzf

cargo install tree-sitter-cli

bob install latest && bob use latest

stow nvim --adopt -t ~
