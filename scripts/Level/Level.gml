// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function level_completed(){
	with (oLevelManager)
	{
		level_complete = true;
		physics_pause_enable(true);
		stats_add_time_to_score();
	}
}

function is_level_complete()
{
	with (oLevelManager)
	{
		return level_complete;
	}
}