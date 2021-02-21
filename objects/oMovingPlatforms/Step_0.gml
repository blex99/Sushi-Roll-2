/// @description 

var _cardinal_dir = round(direction/90);
image_index = _cardinal_dir;

if (path_action != path_action_restart)
{
	var _dir = sign(path_speed);
	if (path_position < 0.05 || path_position > 0.95)
		path_speed = lerp(_dir * 0.25, path_speed, 0.1);
	else
		path_speed = move_speed * _dir;
}


add_to_debug_map("path_position: " + string(path_position));