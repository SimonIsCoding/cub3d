# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pde-masc <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/19 11:50:04 by pde-masc          #+#    #+#              #
#    Updated: 2024/09/19 15:12:45 by pde-masc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

BROWN =	\033[38;2;184;143;29m
ORANGE = \033[38;5;209m
BLUE = \033[0;94m
DEF_COLOR = \033[0;39m
GREEN =	\033[0;92m
GREY = \033[38;5;245m

NAME = cub3d
CC = gcc
CFLAGS = -Werror -Wextra -Wall -g3
MLXFLAGS = -Lmlx -lmlx -L/usr/lib/X11 -lXext -lX11
INCLUDES = -I./header -I./usr/include -Imlx

MLX_DIR = ./mlx
MLX = $(MLX_DIR)/libmlx_Linux.a

LIBFT_DIR = ./libft
LIBFT = $(LIBFT_DIR)/libft.a
LIBFT_HEADER = $(LIBFT_DIR)/libft.h

SRCS_DIR = srcs/
OBJS_DIR = objs/

SRCS = $(wildcard $(SRCS_DIR)*.c)
OBJS = $(addprefix $(OBJS_DIR),$(notdir $(SRCS:.c=.o)))

all: $(NAME)

$(NAME): $(LIBFT) $(MLX) $(OBJS_DIR) $(OBJS) $(HEADER) Makefile
	@$(CC) $(CFLAGS) $(MLXFLAGS) $(OBJS) $(INCLUDES) -o $@ $<
	@echo "$(GREEN)$(NAME) created$(DEF_COLOR)"

$(OBJS_DIR)%.o: $(SRCS_DIR)%.c $(HEADER) Makefile
	@echo "$(BROWN)Compiling   ${BLUE}→   $(ORANGE)$< $(DEF_COLOR)"
	@$(CC) -c $(CFLAGS) $(INCLUDES) $< -o $@
$(OBJS_DIR):
	@mkdir $@

$(LIBFT): $(LIBFT_HEADER)
	@echo "$(GREY)Compiling libft$(DEF_COLOR)"
	@$(MAKE) -s -C $(LIBFT_DIR)

$(MLX):
	@echo "$(GREY)Compiling mlx$(DEF_COLOR)"
	@$(MAKE) -s -C $(MLX_DIR)
	@echo "$(GREEN)mlx compiled successfully$(DEF_COLOR)"

clean:
	@$(MAKE) -s -C $(LIBFT_DIR) clean
	@rm -rf $(MLX_DIR)/obj
	@rm -rf $(OBJS_DIR)
	@echo "$(GREEN)Objects removed$(DEF_COLOR)"

fclean: clean
	@$(MAKE) -s -C $(MLX_DIR) clean
	@rm -f $(LIBFT)
	@rm -f $(NAME)
	@echo "$(GREEN)Binaries removed$(DEF_COLOR)"

re:	fclean all

.PHONY:	all clean fclean re
