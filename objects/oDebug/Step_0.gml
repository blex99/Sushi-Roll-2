/// @desc debug commands

if (keyboard_check_pressed(ord("V")))
{
	global.debug.show_debug = !global.debug.show_debug;
}

// move the sushi to precisely to the goal hitbox
if (keyboard_check_pressed(ord("C")))
{
	var _gx, _gy;
	
	with (oGoal)
	{
		_gx = x + sprite_width / 2;
		_gy = y + sprite_height;
	}
	
	with (sushi_cur())
	{
		phy_position_x = _gx;
		phy_position_y = _gy;
	}
}