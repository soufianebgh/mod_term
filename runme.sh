#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
ZSH_CUSTOM=~/.oh-my-zsh/custom/plugins

if command -v apt &> /dev/null; then
    sudo apt update -y && sudo apt install -y zsh curl git exa 
elif command -v yum &> /dev/null; then
    sudo yum update -y && sudo yum install -y zsh curl exa 
fi

curl -sS https://starship.rs/install.sh | sh -s -- -y

mkdir -p ~/.config
cp "$SCRIPT_DIR/files/starship.toml" ~/.config/ 
cp "$SCRIPT_DIR/files/.zshrc" ~/

mkdir -p "$ZSH_CUSTOM"
# On ajoute une vérification pour ne pas cloner si ça existe déjà
[[ ! -d "$ZSH_CUSTOM/fast-syntax-highlighting" ]] && git clone --depth 1 https://github.com/zdharma-continuum/fast-syntax-highlighting.git "$ZSH_CUSTOM/fast-syntax-highlighting"
[[ ! -d "$ZSH_CUSTOM/zsh-autocomplete" ]] && git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git "$ZSH_CUSTOM/zsh-autocomplete"
[[ ! -d "$ZSH_CUSTOM/zsh-autosuggestions" ]] && git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/zsh-autosuggestions"
#[[ ! -d "$ZSH_CUSTOM/zsh-syntax-highlighting" ]] && git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/zsh-syntax-highlighting"

# 5. Switch shell
sudo chsh -s $(which zsh) $(whoami)

echo "Zsh installled and correctly configured. You have to reopen the shell to see the changes."