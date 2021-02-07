/// @description detect if the player hasn't moved in the last 5 seconds

if (my_previous_x == x && my_previous_y == y &&
	level_is_state_playing())
{
	info_box_create("If you're stuck, pause and reset!");
}
else
{
	my_previous_x = x;
	my_previous_y = y;
	alarm[1] = room_speed * time_to_detect;
}