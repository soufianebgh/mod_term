#!/usr/bin/env bash

ZSH_CUSTOM=~/.oh-my-zsh/custom/plugins

if [ -f /etc/debian_version ]; then
    DISTRO="debian"
elif [ -f /etc/redhat-release ]; then
    DISTRO="centos"
else
    echo "Distribution non prise en charge."
    exit 1
fi

if [ "$DISTRO" = "debian" ]; then
        sudo apt update
        sudo apt install -y zsh curl exa 
elif [ "$DISTRO" = "centos" ]; then
        sudo yum update -y
        sudo yum install -y zsh curl exa 
 fi

curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init bash)"' >> ~/.bashrc

mkdir -p ~/.config
cp ./starship.toml ~/.config/ 
cp ./.zshrc ~/

mkdir -p "$ZSH_CUSTOM"

git clone --depth 1 https://github.com/zdharma-continuum/fast-syntax-highlighting.git "$ZSH_CUSTOM/fast-syntax-highlighting"
git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git "$ZSH_CUSTOM/zsh-autocomplete"
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/zsh-autosuggestions"
git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/zsh-syntax-highlighting"

chsh -s $(which zsh) #make zsh main shell 

source ~/.zshrc
