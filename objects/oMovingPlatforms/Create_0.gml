/// @description assign a path

var _path = path_duplicate(path);

path_start(_path, move_speed, path_action, false);
path_position = normalized_start;

if (flip) path_flip(_path);