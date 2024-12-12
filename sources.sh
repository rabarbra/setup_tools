#!/bin/bash
set -e

# Define installation directories
BIN_DIR="/usr/local/bin"

# Install curl
if ! command -v curl &>/dev/null; then
  echo "Installing curl..."
  curl -LO https://curl.se/download/curl-7.88.1.tar.gz
  tar -xzf curl-7.88.1.tar.gz && cd curl-7.88.1
  ./configure && make && sudo make install
  cd .. && rm -rf curl-7.88.1 curl-7.88.1.tar.gz
fi

# Install Vim
if ! command -v vim &>/dev/null; then
  echo "Installing Vim..."
  curl -LO https://github.com/vim/vim/archive/refs/tags/v9.0.1427.tar.gz
  tar -xzf v9.0.1427.tar.gz && cd vim-9.0.1427
  ./configure && make && sudo make install
  cd .. && rm -rf vim-9.0.1427 v9.0.1427.tar.gz
fi

# Install Zsh
if ! command -v zsh &>/dev/null; then
  echo "Installing Zsh..."
  curl -LO https://sourceforge.net/projects/zsh/files/latest/download -o zsh.tar.xz
  tar -xJf zsh.tar.xz && cd zsh-*
  ./configure && make && sudo make install
  cd .. && rm -rf zsh-*
fi

# Install Oh-My-Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh-My-Zsh..."
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install gping
if ! command -v gping &>/dev/null; then
  echo "Installing gping..."
  curl -s https://api.github.com/repos/orf/gping/releases/latest \
    | grep "browser_download_url.*musl.tar.gz" \
    | cut -d '"' -f 4 \
    | wget -qi - && tar -xzvf gping_*.tar.gz && sudo mv gping $BIN_DIR && rm gping_*.tar.gz
fi

# Install ncdu
if ! command -v ncdu &>/dev/null; then
  echo "Installing ncdu..."
  curl -LO https://dev.yorhel.nl/download/ncdu-1.17.tar.gz
  tar -xzf ncdu-1.17.tar.gz && cd ncdu-1.17
  ./configure && make && sudo make install
  cd .. && rm -rf ncdu-1.17 ncdu-1.17.tar.gz
fi

# Install duf
if ! command -v duf &>/dev/null; then
  echo "Installing duf..."
  curl -LO https://github.com/muesli/duf/releases/latest/download/duf_0.8.1_linux_amd64.tar.gz
  tar -xzf duf_0.8.1_linux_amd64.tar.gz && sudo mv duf $BIN_DIR && rm duf_0.8.1_linux_amd64.tar.gz
fi

# Install Git
if ! command -v git &>/dev/null; then
  echo "Installing Git..."
  curl -LO https://github.com/git/git/archive/refs/tags/v2.41.0.tar.gz
  tar -xzf v2.41.0.tar.gz && cd git-2.41.0
  make prefix=/usr/local all && sudo make prefix=/usr/local install
  cd .. && rm -rf git-2.41.0 v2.41.0.tar.gz
fi

# Install Neofetch
if ! command -v neofetch &>/dev/null; then
  echo "Installing Neofetch..."
  curl -LO https://github.com/dylanaraps/neofetch/archive/refs/tags/7.1.0.tar.gz
  tar -xzf 7.1.0.tar.gz && cd neofetch-7.1.0
  sudo make PREFIX=/usr/local install
  cd .. && rm -rf neofetch-7.1.0 7.1.0.tar.gz
fi

# Install htop
if ! command -v htop &>/dev/null; then
  echo "Installing htop..."
  curl -LO https://github.com/htop-dev/htop/archive/refs/tags/3.2.2.tar.gz
  tar -xzf 3.2.2.tar.gz && cd htop-3.2.2
  ./autogen.sh && ./configure && make && sudo make install
  cd .. && rm -rf htop-3.2.2 3.2.2.tar.gz
fi

# Final message
echo "All requested tools are installed successfully!"
