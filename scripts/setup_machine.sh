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
    gnuplot \           # Plotting
    grsync \            # Backup
    gparted \           # Partition editor
    gnome-calculator \  # Calculator
    ncdu \              # Disk usage analyzer
    gvfs-backends \     # File transfer
    gnome-clocks \       # Clock
)

dev_packages=(
    gcc \
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
    James-Yu.latex-workshop \
)

code --install-extension ${extensions[@]}

# Install Zoom
wget https://zoom.us/client/latest/zoom_amd64.deb -O /tmp/zoom_amd64.deb
sudo apt install /tmp/zoom_amd64.deb

# Install albertlauncher
# sudo add-apt-repository ppa:nilarimogard/webupd8
# sudo apt update
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
curl -fsSL https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_manuelschneid3r.gpg > /dev/null
sudo apt update
sudo apt install albert


# Add /src/scripts to PATH if it doesn't exist
if [[ ! $PATH =~ .*\/src\/scripts.* ]]; then
    echo "export PATH=$PATH:/src/scripts" >> ~/.bashrc
fi

