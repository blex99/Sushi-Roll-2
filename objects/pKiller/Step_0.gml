///@desc activates alarm


if (alarm[0] == -1 && place_meeting(x, y, sushi_cur()))
{
	alarm[0] = time_to_restart;
}