if (place_meeting(x, y, pSushi))
{
	sushi_change_size(true);
	stats_increment_rice_counter();
	instance_destroy();
}