/// @description set path
event_inherited();

my_path_speed = 0;
if (path != -1 && path_exists(path))
{
	path_start(path, 2, path_action_reverse, false);
	path_position = random(1);
	path_speed = my_path_speed;
}

