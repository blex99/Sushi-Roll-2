/// @description assign a path

my_path = path_duplicate(path);
path_start(my_path, move_speed, path_action, false);

 // used for path_action_reverse platforms
path_speed_reverse = 0;
reverse_buffer = 0;

path_speed_prev = 0; // used for pause



image_speed = 0;
path_position = normalized_start;
if (flip) path_flip(my_path);