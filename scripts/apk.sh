#!/bin/sh
apk update && apk upgrade

# Install packages
apk add \
  vim zsh git neofetch htop openssh nmap bind-tools \
  speedtest-cli net-tools traceroute mtr jq ncdu duf gping

# Install Oh-My-Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
