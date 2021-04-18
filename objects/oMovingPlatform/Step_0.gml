/// @description 

if (level_is_state(LEVEL.PAUSED))
{
	path_speed = 0;
	exit;
}

var _move_dir = sign(path_speed);
var _cardinal_dir = deg2card(direction);
image_index = _cardinal_dir;

if (path_action != path_action_restart)
{
	if (path_position < 0.05 || path_position > 0.95)
		path_speed = lerp(_move_dir * 0.25, path_speed, 0.1);
	else
		path_speed = move_speed * _move_dir;
}