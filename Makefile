SHELL = /bin/bash

DIR = ~/.bin

NAME = ~/.bin/hpp

SRCS = main.cpp

INCLUDES = main.hpp

FLAGS = -Wall -Wextra -Werror

all : $(NAME) .first

$(DIR) :
	@mkdir $(DIR) 2> /dev/null && echo $(DIR) created successfully || echo "failed to create " $(DIR)

$(NAME) : $(DIR) $(SRCS) $(INCLUDES)
	@g++ $(FLAGS) $(SRCS) -o $@ && echo compilation Done

.first :
	@echo >> ~/.zshrc && echo "PATH=$$PATH:~/.bin" >> ~/.zshrc && echo >> ~/.zshrc && echo updating PATH for zsh Done
	@echo >> ~/.bashrc && echo "PATH=$$PATH:~/.bin" >> ~/.bashrc && echo >> ~/.bashrc && echo updating PATH for bash Done
	@source ~/.zshrc && echo relaoding PATH in zsh Done
	@source ~/.bashrc && echo relaoding PATH in bash Done && touch .first && echo you may need to reopen the shell to use the program || echo Error

update :
	@git pull > /dev/null 2> /dev/null && make && echo update done || echo Error

.PHONY : update
