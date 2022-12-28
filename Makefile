# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyap <hyap@student.42kl.edu.my>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/14 12:49:23 by hyap              #+#    #+#              #
#    Updated: 2022/12/28 18:36:12 by hyap             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= test
SRCS		= $(wildcard *.cpp)
OBJS 		= $(SRCS:.cpp=.o)
DEPENDS		= $(OBJS:.o=.d)
CPPFLAGS	= -Wall -Werror -Wextra -Wshadow -std=c++98 -pedantic -MMD 
LDFLAGS		= -lstdc++

INCLUDES	= ../includes

all: $(NAME)

%.o: %.cpp
	$(CC) $(CPPFLAGS) -I$(INCLUDES) -c $< -o $@

$(NAME): $(OBJS)
	$(CC) $(LDFLAGS) $^ -o $(NAME)

-include $(DEPENDS)

clean:
	$(RM) $(OBJS) $(DEPENDS)

fclean: clean
	$(RM) $(NAME)

re:	fclean all
