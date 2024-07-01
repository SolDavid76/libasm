/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: djanusz <djanusz@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/06/27 15:23:55 by djanusz           #+#    #+#             */
/*   Updated: 2024/07/01 20:53:13 by djanusz          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#define BUFFER_SIZE 64

char g_buffer[BUFFER_SIZE] = {0};

void buffer_reset(void)
{
	for (int i = 0; i < BUFFER_SIZE; i++)
		g_buffer[i] = '\0';
}


int main(int ac, char **av)
{
	if (ac != 3)
	{
		write(1, "./a.out hey hello\n", 18);
		exit(1);
	}

	int fd = 0;
	char *tmp = NULL;

	/* ft_strlen */
	printf("strlen(\"%s\") = %ld\n", av[1], strlen(av[1]));
	printf("ft_strlen(\"%s\") = %ld\n\n", av[1], ft_strlen(av[1]));

	/* ft_strcpy */
	printf("strcpy(\"%s\", \"%s\") = \"%s\"\n", g_buffer, av[1], strcpy(g_buffer, av[1]));
	buffer_reset();
	printf("ft_strcpy(\"%s\", \"%s\") = \"%s\"\n\n", g_buffer, av[1], ft_strcpy(g_buffer, av[1]));
	buffer_reset();

	/* ft_strcmp */
	printf("strcmp(\"%s\", \"%s\") = %d\n", av[1], av[2], strcmp(av[1], av[2]));
	printf("ft_strcmp(\"%s\", \"%s\") = %d\n\n", av[1], av[2], ft_strcmp(av[1], av[2]));

	/* ft_write */
	fd = write(-1, av[1], strlen(av[1]));
	printf("\nwrite(1, \"%s\", strlen(av[1])) = %d (errno = %d)\n", av[1], fd, errno);
	fd = ft_write(-1, av[1], ft_strlen(av[1]));
	printf("\nft_write(1, \"%s\", ft_strlen(av[1])) = %d (errno = %d)\n\n", av[1], fd, errno);

	/* ft_read */
	fd = read(-1, g_buffer, BUFFER_SIZE);
	printf(" | read(-1, \"%s\", BUFFER_SIZE) = %d (errno = %d)\n", g_buffer, fd, errno);
	buffer_reset();
	fd = ft_read(-1, g_buffer, BUFFER_SIZE);
	printf(" | ft_read(-1, \"%s\", BUFFER_SIZE) = %d (errno = %d)\n\n", g_buffer, fd, errno);
	buffer_reset();

	/* ft_strdup  */
	tmp = strdup(av[1]);
	printf("strdup(\"%s\") = %p (%s)\n", av[1], tmp, tmp);
	free(tmp);
	tmp = ft_strdup(av[1]);
	printf("ft_strdup(\"%s\") = %p (%s)\n", av[1], tmp, tmp);
	free(tmp);
}