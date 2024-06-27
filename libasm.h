/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: djanusz <djanusz@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/06/27 15:23:23 by djanusz           #+#    #+#             */
/*   Updated: 2024/06/27 18:44:42 by djanusz          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#pragma once

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>

size_t	ft_strlen(const char *);
char	*ft_strcpy(char *, const char *);
int		ft_strcmp(const char *, const char *);
ssize_t	ft_write(int, const void *, size_t);
ssize_t	ft_read(int, void *, size_t);
char	*ft_strdup(const char *);
