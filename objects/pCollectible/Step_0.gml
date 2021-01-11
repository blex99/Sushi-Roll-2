/// @desc oscillate and detect sushi

y = oscillate(ystart, 2, 1);

if (place_meeting(x, y, sushi_cur()))
{
	stats_increment_collectible_counter();
	instance_destroy();
}