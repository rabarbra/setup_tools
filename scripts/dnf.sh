#!/bin/bash
sudo dnf update -y

sudo dnf copr enable atim/gping -y 

# Install packages
sudo dnf install -y \
  vim zsh git neofetch htop openssh nmap bind-utils \
  speedtest-cli net-tools traceroute mtr jq ncdu duf gping

# Install Oh-My-Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
