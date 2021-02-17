///@desc activates alarm

var _sushi = sushi_cur();
if (alarm[0] == -1 && place_meeting(x, y, _sushi))
{
	alarm[0] = restart_frames;
	
	killed_sushi = true;
}