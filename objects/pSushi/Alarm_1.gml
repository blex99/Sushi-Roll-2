/// @description detect if the player hasn't moved in the last 5 seconds

var _epsilon = 0.5;
if (abs(my_previous_x - x) < _epsilon &&
	abs(my_previous_y - y) < _epsilon &&
	level_is_state(LEVEL.PLAYING))
{
	info_box_create("Stuck? Pause and reset!");
}
else
{
	my_previous_x = x;
	my_previous_y = y;
	alarm[1] = room_speed * time_to_detect;
}