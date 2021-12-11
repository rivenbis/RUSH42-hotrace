# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: agautier <agautier@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/10 21:42:24 by agautier          #+#    #+#              #
#    Updated: 2021/12/11 14:03:12 by agautier         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	hotrace

S			=	src/
O			=	obj/
I			=	header/
D			=	dep/

SRC			=	src/main.c	\
				\
				src/outbuf/outbuf_add.c \
				src/outbuf/outbuf_print.c

OBJ			=	$(SRC:$S%.c=$O%.o)
DEP			=	$(SRC:$S%.c=$D%.d)

CC			=	cc

CFLAGS		+=	-I$I
CFLAGS		+=	-Wall -Wextra -Werror -g3 -fsanitize=address

LDFLAGS		+= -g3 -fsanitize=address	# TODO: remove

RM			=	/bin/rm -f
RMDIR		=	/bin/rm -Rf

.PHONY:	all clean fclean re

all: $(NAME)

$O:
	@mkdir -p $@

$(OBJ): | $O

$(OBJ): $O%.o: $S%.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

$D:
	@mkdir -p $@

$(DEP): | $D

$(DEP): $D%.d: $S%.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -MM -MF $@ -MT "$O$*.o $@" $<

$(NAME): $(OBJ)
	$(CC) $(LDFLAGS) $^ -o $@

clean:
	$(RM) $(wildcard $(OBJ))
	$(RMDIR) $O
	$(RM) $(wildcard $(DEP))
	$(RMDIR) $D

fclean: clean
	$(RM) $(NAME)

re: fclean
	$(MAKE)

-include $(DEP)