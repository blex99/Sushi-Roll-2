/// @desc debug commands

if (keyboard_check_pressed(ord("V")))
	show_debug = !show_debug;

if (keyboard_check_pressed(ord("C")))
{
	with (sushi_cur())
	{
		phy_position_x = oGoal.x - oGoal.sprite_width / 2;
		phy_position_y = oGoal.y + oGoal.sprite_height;
	}
}

if (keyboard_check_pressed(ord("Q")))
{
	info_box_create("test");
}


add_to_debug_map("fps: " + string(fps));