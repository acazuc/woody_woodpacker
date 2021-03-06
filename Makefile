NAME = woody_woodpacker

CC = gcc

CFLAGS = -std=gnu99 -Wall -Wextra -Ofast

INCLUDES_PATH = -I include

SRCS_PATH = src/

SRCS_NAME = main.c \
	parse_file.c \
	crypt_file.c \
	libosef.c \
	file_output.c \
	asmninsert.c \
	swabxx.c \
	print.c \
	inject.c \
	prepare_decrypt.c \
	key_derivate.c \

SRCS = $(addprefix $(SRCS_PATH), $(SRCS_NAME))

OBJS_PATH = obj/

OBJS_NAME = $(SRCS_NAME:.c=.o)

OBJS = $(addprefix $(OBJS_PATH), $(OBJS_NAME))

all: odir $(NAME)

$(NAME): $(OBJS)
	@echo " - Making $@"
	@$(CC) $(CFLAGS) -o $@ $^

$(OBJS_PATH)%.o: $(SRCS_PATH)%.c
	@echo " - Compiling $<"
	@$(CC) $(CFLAGS) -o $@ -c $< $(INCLUDES_PATH)

odir:
	@mkdir -p $(OBJS_PATH)

clean:
	@echo " - Cleaning objs"
	@rm -f $(OBJS)

fclean: clean
	@echo " - Cleaning lib"
	@rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re odir
