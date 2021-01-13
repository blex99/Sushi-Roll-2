// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function water_cause_wave(_this, _xroom)
{
	with (_this)
	{
		var room_pos = abs(_xroom - bbox_left);
		var norm_pos = room_pos / sprite_width;
		var i = lerp(0, springCount, norm_pos);
		springs[i] = -16;
	}
}
