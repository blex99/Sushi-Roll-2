if (place_meeting(x, y, pSushi))
{
	sushi_change_size(true);
	oStats.rice_count++;
	instance_destroy();
}