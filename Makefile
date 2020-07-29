# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aromny-w <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/12/02 02:41:38 by aromny-w          #+#    #+#              #
#    Updated: 2019/07/10 09:13:58 by aromny-w         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
LIBFT = libft/libft.a

CC = gcc
CFLAGS = -Wall -Wextra -Werror $(INC)

SRCS = ft_printf.c flags.c width.c prec.c mod.c spec.c unknown.c percent.c \
	   integer.c unsigned.c octal.c hexa.c float.c character.c string.c \
	   pointer.c wcharacter.c
SRCS := $(addprefix srcs/, $(SRCS))

OBJS = $(SRCS:.c=.o)

INC = -I includes -I libft/includes

%.o: %.c
		@$(CC) $(CFLAGS) -c $< -o $@

all: $(NAME)

$(NAME): $(OBJS)
		@make -sC libft
		@cp $(LIBFT) $(NAME)
		@ar rc $(NAME) $(OBJS)
		@ranlib $(NAME)

clean:
		@make clean -C libft
		@/bin/rm -f $(OBJS)

fclean: clean
		@make fclean -C libft
		@/bin/rm -f $(NAME)

re: fclean all
