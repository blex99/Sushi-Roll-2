/// @description 

if (level_is_state(LEVEL.PAUSED))
	exit;

var _cardinal_dir = deg2card(direction);
image_index = _cardinal_dir;

if (path_action == path_action_reverse)
{
	// if you've reached the end of the path for the first time
	// pause for a bit before moving to the next path
	if (alarm[0] == -1 && (path_position == 0 || path_position == 1) &&
		reverse_buffer == 0)
	{
		path_speed_reverse = path_speed;
		alarm[0] = room_speed;
		path_speed = 0;
	}
	
	// to prevent infinite loop, allow the platform
	// a couple frames to move to a new path_position
	reverse_buffer = max(0, reverse_buffer - 1);
}

// decrement timers of dots
var _len = ds_list_size(path_dots);
for (var i = 0; i < _len; i++)
{
	path_dots[|i].life_timer--;
	if (path_dots[|i].life_timer <= 0)
	{
		ds_list_delete(path_dots, i);
		 _len--;
		 i--;
	}
}