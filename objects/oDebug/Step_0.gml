/// @desc debug commands

// goto 10th level if pressed 0
if (keyboard_check_pressed(vk_left)) game_goto_previous_level();
if (keyboard_check_pressed(vk_right)) game_goto_next_level();
	

	
if (keyboard_check_pressed(ord("C")))
{
	with (sushi_cur())
	{
		phy_position_x = oGoal.x + oGoal.sprite_width / 2;
		phy_position_y = oGoal.y - oGoal.sprite_height;
	}
}

