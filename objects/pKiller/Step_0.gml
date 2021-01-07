///@desc activates alarm

if (alarm[0] == -1 && place_meeting(x, y, sushi_cur()) && !sushi_invincible())
{
	alarm[0] = restart_frames;
}