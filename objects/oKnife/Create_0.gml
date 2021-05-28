/// @description set path
event_inherited();

if (path != -1 && path_exists(path))
{
	path_start(path, my_path_speed, path_action_reverse, false);
	path_position = random(1);
}

sfx_knife = sfxKnife;
played_sound = false;