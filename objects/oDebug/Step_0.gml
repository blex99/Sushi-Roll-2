if (keyboard_check(vk_escape)) game_end();
if (keyboard_check(ord("R")) && keyboard_check(vk_lcontrol)) game_restart();
if (keyboard_check(ord("R"))) room_restart();
if (keyboard_check(ord("P")))
{
	sushi_cur().phy_position_x = oGoal.phy_position_x + 5;
	sushi_cur().phy_position_y = oGoal.phy_position_y;
}


sushi_cur().image_xscale
add_to_debug_map("scale: " + string(sushi_cur().image_xscale));