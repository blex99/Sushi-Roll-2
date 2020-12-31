if (keyboard_check(vk_escape)) game_end();
if (keyboard_check(ord("R")) && keyboard_check(vk_lcontrol)) game_restart();
if (keyboard_check(ord("R"))) room_restart();
if (keyboard_check(ord("P")))
{
	oCamera.follow.phy_position_x = oGoal.phy_position_x + 5;
	oCamera.follow.phy_position_y = oGoal.phy_position_y;
}