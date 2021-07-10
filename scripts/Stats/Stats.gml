function stats_increment_rice_counter()
{
	with (oStats)
	{
		rice_increased_this_round++;
	}
}

function stats_get_num_rice()
{
	with (oStats) return rice_increased_this_round;
}

// returns true if you have a chance to get the speedy bonus
function stats_time_goal_met()
{
	// get the time goal from level manager....
	var _goal;
	with (oLevelManager)
		_goal = level.time_sec_goal;
	
	with (oStats)
		return sec2mus(_goal) > timer_get_time();
}