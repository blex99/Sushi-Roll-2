/// @desc move towards knife

event_inherited();

if (killed_sushi && !sushi_invincible())
{
	var _xcenter = (bbox_right + bbox_left) * 0.5;
	var _ycenter = (bbox_bottom + bbox_top) * 0.5;	
	
	with (sushi_cur())
	{
		phy_position_x = lerp(phy_position_x, _xcenter - 7, 0.1);
		phy_position_y = lerp(phy_position_y, _ycenter, 0.1);
		phy_angular_velocity = 0;
		phy_linear_velocity_x = 0;
		phy_linear_velocity_y = 0;
	}
}

add_to_debug_map("killed_sushi: " + string(killed_sushi));