function stats_increment_rice_counter()
{
	with (oStats)
	{
		rice_count++;
		rice_count = clamp(rice_count, 0, rice_max);
	}
}

function stats_get_num_rice()
{
	with (oStats) return rice_count;
}

// returns true if you have a chance to get the speedy bonus
function stats_time_goal_met()
{
	// get the time goal from level manager....
	var _goal;
	with (oLevelManager)
		_goal = level_struct.time_sec_goal;
	
	with (oStats)
		return sec2mus(_goal) > timer_get_time();
}