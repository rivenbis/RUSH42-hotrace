/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   buffer_add.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mamaquig <mamaquig@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/12/11 12:02:35 by agautier          #+#    #+#             */
/*   Updated: 2021/12/11 15:25:32 by mamaquig         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "hotrace.h"

/*
**	Add str in output buffer.
*/
void	buffer_add(t_buffer *buf, char *str)
{
	unsigned int	i;

	i = 0;
	while (str[i] != '\0')
	{
		if (buf->head >= BUFFER_SIZE)
			buffer_print(buf);
		buf->data[buf->head] = str[i];
		i += 1;
		buf->head += 1;
	}
}
