#!/bin/bash

curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init bash)"' >> ~/.bashrc

sudo apt update && sudo apt install zsh -y


