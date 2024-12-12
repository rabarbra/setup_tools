#!/bin/bash

# Exit on error
set -e

BASE_URL="https://raw.githubusercontent.com/rabarbra/setup_tools/main/scripts"

# Function to detect OS and execute corresponding script
detect_and_execute() {
  OS="$(uname -s)"
  case "$OS" in
    Linux)
      if [ -f /etc/debian_version ]; then
        echo "Detected Debian/Ubuntu system."
        bash <(curl -s "$BASE_URL/apt.sh")
      elif [ -f /etc/arch-release ]; then
        echo "Detected Arch Linux system."
        bash <(curl -s "$BASE_URL/pacman.sh")
      elif [ -f /etc/redhat-release ]; then
        echo "Detected RedHat/CentOS system."
        bash <(curl -s "$BASE_URL/dnf.sh")
      elif [ -f /etc/alpine-release ]; then
        echo "Detected Alpine Linux system."
        bash <(curl -s "$BASE_URL/apk.sh")
      else
        echo "Linux distribution not supported by this script."
        exit 1
      fi
      ;;
    Darwin)
      echo "Detected macOS."
      bash <(curl -s "$BASE_URL/brew.sh")
      ;;
    *)
      echo "Unsupported operating system: $OS"
      exit 1
      ;;
  esac
}

# Execute the detection and installation
detect_and_execute
