#ifndef PARSING_H
# define PARSING_H

#include "cub3d.h"

# ifndef BUFFER_SIZE 
#  define BUFFER_SIZE 42
# endif

# define MAP_EXTENSION ".cub"

typedef struct  s_map
{
    int         *map;
    int         n_rows;
    int         n_cols;
    char        *north_path;
    char        *south_path;
    char        *west_path;
    char        *east_path;

}               t_map;

char	*get_next_line(int fd);
void	check_args(int argc, char **argv);

#endif