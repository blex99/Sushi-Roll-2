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
		level_score = rice_value * rice_count;
		level_score += collectible_value * collectible_count;
	}
}

function stats_add_time_to_score()
{
	with (oStats)
	{
		level_score += timer_calc_time_bonus();
	}
}