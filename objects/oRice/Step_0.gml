if (place_meeting(x, y, pSushi))
{
	sushi_grow();
	oStats.rice_count++;
	instance_destroy();
}

