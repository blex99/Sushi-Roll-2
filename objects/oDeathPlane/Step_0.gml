if (alarm[0] != -1)
{
	sushi_cur().image_alpha = alarm[0] / time_to_restart;
}
else if (place_meeting(x, y, sushi_cur()))
{
	alarm[0] = time_to_restart;
}