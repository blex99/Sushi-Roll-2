/// @desc move towards knife

event_inherited();

if (alarm[0] != -1 && !sushi_invincible())
{
	var xcenter = (bbox_right + bbox_left) * 0.5;
	var ycenter = (bbox_bottom + bbox_top) * 0.5;	
	
	with (sushi_cur())
	{
		phy_position_x += (xcenter - phy_position_x) * 0.1;
		phy_position_y += (ycenter - phy_position_y) * 0.1;
		phy_angular_velocity = 0;
	}
}