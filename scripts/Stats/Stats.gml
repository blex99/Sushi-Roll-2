function stats_increment_rice_counter()
{
	with (oStats)
	{
		rice_count++;
		rice_count = clamp(rice_count, 0, rice_max);
	}
	stats_update_score();
}

function stats_increment_collectible_counter()
{
	with (oStats)
	{
		collectible_count++;
		collectible_count = clamp(collectible_count, 0, collectible_max);
	}
	stats_update_score();
}

function stats_update_score()
{
	with (oStats)
	{
		level_score = VALUE_RICE * rice_count;
		level_score += VALUE_COLLECTIBLE * collectible_count;
	}
}

function stats_collected_everything()
{
	with (oStats)
	{
		return collectible_count == collectible_max &&
			   rice_count == rice_max;
	}
}

// returns true if you have a chance to get the speedy bonus
function stats_under_time_requirement()
{
	// get the time requirement from level manager....
	var _req;
	with (oLevelManager)
		_req = level_struct.time_sec_req;
	
	with (oStats)
		return sec2mus(_req) > timer_get_time();
}

// add time and collectors bonus (used by level_completed())
// this will be the final score of the level
function stats_calc_final_score()
{
	with (oStats)
	{
		if (stats_collected_everything())
			level_score += VALUE_COLLECTOR_BONUS;
		
		if (stats_under_time_requirement())
			level_score += VALUE_SPEEDY_BONUS;
	}
}

// returns an array of stats as a formatted strings
function stats_get_array()
{
	with (oStats)
	{
		var _arr = 
		[
			string(VALUE_RICE * rice_count),
			string(VALUE_COLLECTIBLE * collectible_count),
			string(level_score)
		];
		var _len = array_length(_arr);

		// add zeros to points until there are four total digits
		for (var i = 0; i < _len; i++)
			string_right_pad_zeros(_arr[i], 4)
		
		return _arr;
	}
}