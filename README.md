liens:
https://github.com/RhesusP/cub3D?tab=readme-ov-file
https://lodev.org/cgtutor/raycasting.html
https://github.com/vinibiavatti1/RayCastingTutorial/wiki

idees de debut:
il faudrait peut etre separer le travail ainsi:

_0_ Organisation des structures/constantes cub3d.h
    _ faudrait etre a 2 pour discuter de l'orga et comprendre le projet

_1_ parsing
    _ si map et infos sont valides
    _ stocker toutes les donnees dans une structure

_2_ utilisation des fonctions MLX
    _ mlx_pixel_put
    _ les fonctions pour les evenements (fenetre, clavier, etc.)

_3_ implementation du "DDA algorithm" et du raycasting

_4_ rendering

Peut-etre qu'il faudrait separer notre code en plusieurs dossiers
genre   srcs/parsing
            /mlx
            /raycasting
            /rendering