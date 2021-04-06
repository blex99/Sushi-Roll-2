/// @description assign a path

my_path = path_duplicate(path);
path_start(my_path, move_speed, path_action, false);

image_speed = 0;
path_position = normalized_start;
if (flip) path_flip(my_path);