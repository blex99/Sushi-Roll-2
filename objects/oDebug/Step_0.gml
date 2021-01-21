/// @desc debug commands

// goto 10th level if pressed 0
if (keyboard_check_pressed(ord("0")))
	transition_start(oGame.levels[9]);

// goto i'th level if pressed i
for (var i = 1; i <= 9; i++)
{
	if (keyboard_check_pressed(ord(string(i))))
		transition_start(oGame.levels[i - 1]);
}
	
if (keyboard_check_pressed(ord("R")))
	transition_start(room);
	
if (keyboard_check_pressed(ord("C")))
{
	with (sushi_cur())
	{
		phy_position_x = oGoal.x + oGoal.sprite_width / 2;
		phy_position_y = oGoal.y - oGoal.sprite_height;
	}
}

if (keyboard_check_pressed(ord("D")))
	show_debug = !show_debug;