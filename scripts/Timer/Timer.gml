function timer_calc_time_bonus()
{
	with (oTimer)
	{
		return time_value * ceil(level_timer / room_speed);
	}
	return -1;
}