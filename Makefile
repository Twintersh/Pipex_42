CC = gcc
NAME = pipex
SRC = src/main.c src/pipex.c src/access.c
OBJ=$(SRC:.c=.o)
LFT = libft
CFLAGS = -Werror -Wall -Wextra -g
LFLAGS = L $(LFT)-lft

all : $(NAME)

%.o : %.c
	@$(CC) $(CFLAGS) -I/src/ -c $< -o $@

$(NAME) : $(OBJ)
	@make -C $(LFT)
	@$(CC) $(CFLAGS) $(OBJ) -L $(LFT) -lft -o $(NAME)

re : fclean all

debug : all

clean :
	@rm -rf src/*.o
	@make fclean -C $(LFT)
	@echo Done

fclean : clean
	@rm -rf $(NAME)

.PHONY : fclean all clean debug re
