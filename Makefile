SRCS_DIR	=	srcs/

SRC			=	ft_strlen.s\
				ft_strcpy.s\
				ft_strcmp.s\
				ft_write.s\
				ft_read.s\
				ft_strdup.s\
				ft_atoi_base.s\
				ft_list_push_front.s\
				ft_list_size.s\
				ft_list_sort.s\
				ft_list_remove_if.s\

SRCS 		=	$(addprefix $(SRCS_DIR), $(SRC))

# PATH_BONUS	=	srcs_bonus/

# SRCS_BONUS	=	ft_atoi_base.s\
# 				ft_list_push_front.s\
# 				ft_list_remove_if.s\
# 				ft_list_size.s\
# 				ft_list_sort.s\

# OBJS_BONUS	=	$(addprefix $(PATH_BONUS), $(SRCS_BONUS:.s=.o))

OBJS_DIR	=	objs/

OBJ			=	$(SRC:.s=.o)

OBJS		=	$(addprefix $(OBJS_DIR), $(OBJ))

INCS		=	./includes/

NASM		=	nasm -f elf64

NAME		=	libasm.a

all			:	$(OBJS_DIR) $(NAME)

bonus		:	$(NAME)

run			:	$(NAME)
					gcc main.c -L. -lasm -no-pie -g
					./a.out

val			:	$(NAME)
					gcc main.c -L. -lasm -no-pie -g
					valgrind ./a.out

gdb			:	$(NAME)
					gcc main.c -L. -lasm -no-pie -g
					gdb ./a.out

$(NAME)		:	$(OBJS)
					ar rc $(NAME) $(OBJS)

$(OBJS_DIR)%.o: $(SRCS_DIR)%.s
				 	$(NASM) -o $@ $<

$(OBJS_DIR)	:
					mkdir $(OBJS_DIR)

clean		:
					rm -rf $(OBJS_DIR)

fclean		:	clean
					rm -f $(NAME)
					rm -f a.out

re			:	fclean all

.PHONY		:	all bonus clean fclean re
