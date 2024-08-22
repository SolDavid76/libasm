/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: djanusz <djanusz@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/06/27 15:23:23 by djanusz           #+#    #+#             */
/*   Updated: 2024/07/02 14:16:24 by djanusz          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#pragma once

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>

/* Mandatory part */
size_t	ft_strlen(const char *);
char	*ft_strcpy(char *, const char *);
int		ft_strcmp(const char *, const char *);
ssize_t	ft_write(int, const void *, size_t);
ssize_t	ft_read(int, void *, size_t);
char	*ft_strdup(const char *);

/* Bonus part */
typedef struct s_list
{
	void			*data;
	struct s_list	*next;
}	t_list;

int		ft_atoi_base(char *, char *);
t_list	*ft_lstnew(void *);
void	ft_list_push_front(t_list **, void *);
int		ft_list_size(t_list *);
void	ft_list_sort(t_list **, int (*)());
void	ft_list_remove_if(t_list **, void *, int (*)(), void (*)(void *));
