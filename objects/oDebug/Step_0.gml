/// @desc debug commands

if (keyboard_check_pressed(ord("1")))
	room_goto(rLevel01);
if (keyboard_check_pressed(ord("2")))
	room_goto(rLevel02);
if (keyboard_check_pressed(ord("3")))
	room_goto(rLevel03);
if (keyboard_check_pressed(ord("4")))
	room_goto(rLevel04);
if (keyboard_check_pressed(ord("5")))
	room_goto(rLevel05)
/*
if (keyboard_check_pressed(ord("6")))
	room_goto(rLevel06);
if (keyboard_check_pressed(ord("7")))
	room_goto(rLevel07);
if (keyboard_check_pressed(ord("8")))
	room_goto(rLevel08);
if (keyboard_check_pressed(ord("9")))
	room_goto(rLevel09);
if (keyboard_check_pressed(ord("0")))
	room_goto(rLevel10)
*/
	
if (keyboard_check_pressed(ord("R")))
	room_restart();
	
if (keyboard_check_pressed(ord("C")))
{
	with (sushi_cur())
	{
		phy_position_x = oGoal.x + oGoal.sprite_width / 2;
		phy_position_y = oGoal.y - oGoal.sprite_height;
	}
}
