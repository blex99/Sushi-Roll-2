/// @description pause

if (level_is_state(LEVEL.PAUSED))
{
	// pause: store previous path speed
	// stop objects from moving
	path_speed_prev = path_speed;
	path_speed = 0;
}
else
{
	// continue movement as normal
	path_speed = path_speed_prev;
}
