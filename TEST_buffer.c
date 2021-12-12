/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   TEST_buffer.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jraffin <jraffin@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/12/11 11:09:19 by agautier          #+#    #+#             */
/*   Updated: 2021/12/12 21:36:10 by jraffin          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include "hotrace.h"

int	main(void)
{
	static t_readbuf	buffer;

	buffer.eof = -1;
	buffer_add(&buffer, "Hello World!\n");
	buffer_add(&buffer, "My name is agautier\n");
	buffer_print(&buffer);
	return (EXIT_SUCCESS);
}
