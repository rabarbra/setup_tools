#!/bin/bash
sudo pacman -Syu --noconfirm

# Install packages
sudo pacman -S --noconfirm \
  vim zsh git neofetch htop openssh nmap bind \
  speedtest-cli net-tools traceroute mtr jq ncdu duf gping

# Install Oh-My-Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
