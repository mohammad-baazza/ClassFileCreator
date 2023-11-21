#!/bin/zsh
c++ -Wall -Wextra -Werror main.cpp -o hpp
mkdir ~/.bin 2>/dev/null
mv hpp ~/.bin
echo '\nPATH=$PATH:~/.bin\n' >> ~/.zshrc
echo '\nPATH=$PATH:~/.bin\n' >> ~/.bashrc
source ~/.zshrc
source ~/.bashrc
