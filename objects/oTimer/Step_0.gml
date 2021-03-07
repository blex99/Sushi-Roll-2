/// @description decrement timer and check if time is up

if (timer_frozen || level_is_state(LEVEL.PAUSED)) exit;

if (timer_counts_down)
{
	timer = max(0, timer - delta_time);
	if (timer <= 0)
	{
		script_execute_args(my_script, my_script_args);
		instance_destroy();
	}
}
else // timer counts up
{
	// caps at ~59 minutes
	timer = min(sec2mus(3599.99), timer + delta_time);
}