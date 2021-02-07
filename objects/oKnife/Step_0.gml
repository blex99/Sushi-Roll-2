/// @desc move towards knife

event_inherited();

if (killed_sushi && !sushi_invincible())
{
	var _xcenter = (bbox_right + bbox_left) * 0.5;
	var _ycenter = (bbox_bottom + bbox_top) * 0.5;	
	
	with (sushi_cur())
	{
		phy_position_x = approach(phy_position_x, _xcenter - 7, 7);
		phy_position_y = approach(phy_position_y, _ycenter, 7);
		phy_angular_velocity = 0;
	}
}