#!/bin/bash
sudo apt-get update
sudo apt-get upgrade

soft_packages=(
    gpick \             # Color picker
    keepassx \          # Password manager
    chromium-browser \  # Chromium
    flameshot \         # Screenshot tool
    gimp \              # Image editor
    vlc \               # Video player
    pandoc \            # Document converter
    gufw \              # Firewall
<<<<<<< Updated upstream
    gnome-calculator \  # Calculator
    ncdu \              # Disk usage analyzer
    gvfs-backends \     # File transfer
)

dev_packages=(
	zsh \
    	gcc \
=======
    grsync \            # Backup
    gparted \           # Partition editor
    ncdu \              # Disk usage analyzer
)

dev_packages=(
    zsh \
    gcc \
>>>>>>> Stashed changes
    g++ \
    cmake \
    build-essential \
    manpages-dev \
    git \
    vim \
    docker.io \
    docker-compose \
    tmux \
    nvim \
)

# Install packages
sudo apt-get install ${soft_packages[@]}
sudo apt-get install ${dev_packages[@]}
sudo apt-get autoremove
# Install oh-my-zsh
if [[ ! -d ~/.oh-my-zsh ]]; then
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi    

# Install VSCode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install code

extensions=(
    ms-python.python \
    ms-vscode.cpptools \
    GitHub.vscode-pull-request-github \
    ms-vscode-remote.vscode-remote-extensionpack \
)

code --install-extension ${extensions[@]}

# Install Zoom
wget https://zoom.us/client/latest/zoom_amd64.deb -O /tmp/zoom_amd64.deb
sudo apt install /tmp/zoom_amd64.deb

<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
