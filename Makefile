SHELL = /bin/zsh

DIR = ~/.bin

NAME = ~/.bin/hpp

SRCS = main.cpp

INCLUDES = main.hpp

FLAGS = -Wall -Wextra -Werror

all : $(NAME) .first

$(DIR) :
	@mkdir $(DIR) 2> /dev/null && echo $(DIR) created successfully || echo "failed to create " $(DIR)

$(NAME) : $(DIR) $(SRCS) $(INCLUDES)
	@c++ $(FLAGS) $(SRCS) -o $@ && echo compilation Done

.first :
	@echo '\nPATH=$$PATH:~/.bin\n' >> ~/.zshrc && echo updating PATH for zsh Done && \
	echo '\nPATH=$$PATH:~/.bin\n' >> ~/.bashrc && echo updating PATH for bash Done && \
	source ~/.zshrc && echo relaoding PATH in zsh Done && \
	source ~/.bashrc && echo relaoding PATH in bash Done && touch .first || echo Error

update :
	@git pull > /dev/null 2> /dev/null && make && echo update done || echo Error

.PHONY : update
