if (keyboard_check(ord("P")))
{
	sushi_cur().phy_position_x = oGoal.phy_position_x + 5;
	sushi_cur().phy_position_y = oGoal.phy_position_y;
}

add_to_debug_map("scale: " + string(sushi_cur().image_xscale));