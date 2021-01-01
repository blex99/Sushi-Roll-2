if (place_meeting(x, y, pSushi))
{
	alarm[0] = time_to_restart;
}


if (alarm[0] != -1)
	pSushi.image_alpha = alarm[0] / time_to_restart;
