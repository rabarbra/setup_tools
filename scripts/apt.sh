#!/bin/bash
sudo apt update && sudo apt upgrade -y

# Install packages
sudo apt install -y \
  vim zsh git neofetch htop openssh-server nmap dnsutils \
  speedtest-cli net-tools traceroute mtr jq ncdu duf gping

# Install Oh-My-Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
