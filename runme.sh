#!/usr/bin/env bash

ZSH_CUSTOM=~/.oh-my-zsh/custom/plugins

sudo apt update && sudo apt install zsh && sudo apt install curl && apt install exa -y

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
