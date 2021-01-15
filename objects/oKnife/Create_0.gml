/// @description set path
event_inherited();

if (path != -1 && path_exists(path))
{
	path_start(path, 2, path_action_reverse, false);
	path_position = random(1);
}