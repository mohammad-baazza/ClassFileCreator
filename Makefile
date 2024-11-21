SHELL = /bin/bash

NAME = hpp

SRCS = main.cpp

INCLUDES = main.hpp

FLAGS = -Wall -Wextra -Werror -O2

all : $(NAME)

dir :
	@echo -n "Enter the directory where you want to install the program (default is ~/.local/bin): "
	@read DIR && [ -z $$DIR ] && echo ~/.local/bin > /tmp/.dir || echo $$DIR > /tmp/.dir
	@mkdir -p $$(cat /tmp/.dir)
	@echo "Directory set to $$(cat /tmp/.dir)"

$(NAME) : dir $(SRCS) $(INCLUDES) path
	@g++ $(FLAGS) $(SRCS) -o $$(cat /tmp/.dir)/$@ && echo "Installed in $$(cat /tmp/.dir)" \
	|| echo "Error while compiling"
	@echo "you may need to reopen the shell to use the program"

path :
	@grep "export PATH=" ~/.zshrc > /tmp/tmp && grep -qs $$(cat /tmp/.dir) /tmp/tmp || (echo  >> ~/.zshrc && echo "export PATH=\$$PATH:$$(echo $$(cat /tmp/.dir))" >> ~/.zshrc)
	@grep "export PATH=" ~/.bashrc > /tmp/tmp && grep -qs $$(cat /tmp/.dir) /tmp/tmp || (echo  >> ~/.bashrc && echo "export PATH=\$$PATH:$$(echo $$(cat /tmp/.dir))" >> ~/.bashrc)

update :
	@git pull > /dev/null 2> /dev/null && make 2>/dev/null && echo "update done" || echo "already up to date"

.PHONY : all update path
