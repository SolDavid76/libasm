/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: djanusz <djanusz@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/06/27 15:23:55 by djanusz           #+#    #+#             */
/*   Updated: 2024/07/02 18:53:01 by djanusz          ###   ########.fr       */
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

t_list *_lstnew(void *content)
{
	t_list *res = malloc(sizeof(t_list));
	res->data = content;
	res->next = NULL;
	return (res);
}

void ft_lstprint(t_list *lst)
{
	while (1)
	{
		if (lst == NULL)
		{
			printf("NULL\n");
			return ;
		}
		else
			printf("%s -> ", (char *)lst->data);
		lst = lst->next;
	}
}

void ft_lstptr(t_list *lst)
{
	while (1)
	{
		if (lst == NULL)
		{
			printf("NULL\n");
			return ;
		}
		else
			printf("%p (%s) -> ", (void *)lst->data, (char *)lst->data);
		lst = lst->next;
	}
}

void ft_free(void *ptr)
{
	printf("ft_free(%p(%s))\n", ptr, (char *)ptr);
	free(ptr);
}

void _list_clear(t_list *lst)
{
	while (lst)
	{
		t_list *tmp = lst->next;
		free(lst->data);
		free(lst);
		lst = tmp;
	}
}

// void _list_sort(t_list **lst, int (*cmp)())
// {
// 	t_list *lst1 = (*lst);

// 	while (lst1)
// 	{
// 		t_list *lst2 = lst1->next;
// 		while (lst2)
// 		{
// 			if (cmp(lst1->data, lst2->data) > 0)
// 			{
// 				void *tmp = lst1->data;
// 				lst1->data = lst2->data;
// 				lst2->data = tmp;
// 			}
// 			lst2 = lst2->next;
// 		}
// 		lst1 = lst1->next;
// 	}
// }

void _list_remove_if(t_list **lstBeigin, void *dataRef, int (*cmpFtn)(), void (*freeFtn)(void *))
{
	t_list *lst1 = *lstBeigin;

	if (cmpFtn(lst1->data, dataRef) == 0)
	{
		*lstBeigin = lst1->next;
		freeFtn(lst1->data);
		free(lst1);
		lst1 = *lstBeigin;
	}
}

int main(int ac, char **av)
{
	int fd = 0;
	char *tmp = NULL;
	t_list *lst = _lstnew(ft_strdup("42"));

	/* ft_strlen */
	// printf("strlen(\"%s\") = %ld\n", av[1], strlen(av[1]));
	// printf("ft_strlen(\"%s\") = %ld\n\n", av[1], ft_strlen(av[1]));

	// /* ft_strcpy */
	// printf("strcpy(\"%s\", \"%s\") = \"%s\"\n", g_buffer, av[1], strcpy(g_buffer, av[1]));
	// buffer_reset();
	// printf("ft_strcpy(\"%s\", \"%s\") = \"%s\"\n\n", g_buffer, av[1], ft_strcpy(g_buffer, av[1]));
	// buffer_reset();

	// /* ft_strcmp */
	// printf("strcmp(\"%s\", \"%s\") = %d\n", av[1], av[2], strcmp(av[1], av[2]));
	// printf("ft_strcmp(\"%s\", \"%s\") = %d\n\n", av[1], av[2], ft_strcmp(av[1], av[2]));

	// /* ft_write */
	// fd = write(1, av[1], strlen(av[1]));
	// printf("\nwrite(1, \"%s\", strlen(av[1])) = %d (errno = %d)\n", av[1], fd, errno);
	// fd = ft_write(1, av[1], ft_strlen(av[1]));
	// printf("\nft_write(1, \"%s\", ft_strlen(av[1])) = %d (errno = %d)\n\n", av[1], fd, errno);

	// /* ft_read */
	// fd = read(-1, g_buffer, BUFFER_SIZE);
	// printf(" | read(-1, \"%s\", BUFFER_SIZE) = %d (errno = %d)\n", g_buffer, fd, errno);
	// buffer_reset();
	// fd = ft_read(-1, g_buffer, BUFFER_SIZE);
	// printf(" | ft_read(-1, \"%s\", BUFFER_SIZE) = %d (errno = %d)\n\n", g_buffer, fd, errno);
	// buffer_reset();

	// /* ft_strdup  */
	// tmp = strdup(av[1]);
	// printf("strdup(\"%s\") = %p (%s)\n", av[1], tmp, tmp);
	// free(tmp);
	// tmp = ft_strdup(av[1]);
	// printf("ft_strdup(\"%s\") = %p (%s)\n\n", av[1], tmp, tmp);
	// free(tmp);

	/* ft_atoi_base */
	// printf("ft_atoi_base(\"%s\", \"%s\") = %d\n", av[1], av[2], ft_atoi_base(av[1], av[2]));

	/* ft_list_push_front */
	// ft_lstprint(lst);
	ft_list_push_front(&lst, ft_strdup("2"));
	ft_list_push_front(&lst, ft_strdup("1"));
	ft_list_push_front(&lst, ft_strdup("8"));
	ft_list_push_front(&lst, ft_strdup("4"));
	ft_list_push_front(&lst, ft_strdup("3"));
	ft_list_push_front(&lst, ft_strdup("6"));
	ft_list_push_front(&lst, ft_strdup("7"));
	ft_list_push_front(&lst, ft_strdup("9"));
	// ft_lstprint(lst);

	/* ft_list_size */
	// printf("ft_list_size(lst) = %d\n", ft_list_size(lst));

	/* ft_list_sort */
	// ft_list_sort(&lst, ft_strcmp);

	/* ft_list_remove_if */
	ft_lstprint(lst);
	// ft_lstptr(lst);
	ft_list_remove_if(&lst, "6", strcmp, free); //crash wen i try to free the freaking data
	ft_lstprint(lst);
	// ft_lstptr(lst);

	_list_clear(lst);
}
