/// @desc move towards knife

event_inherited();

if (level_is_state(LEVEL.PAUSED))
{
	path_speed = 0;
	exit;
}
else
{
	path_speed = my_path_speed;
}


if (killed_sushi)
{
	path_speed = 0;
	with (sushi_cur())
	{
		phy_linear_velocity_x = lerp(phy_linear_velocity_x, 0, 0.5);
		phy_linear_velocity_y = lerp(phy_linear_velocity_y, 0, 0.95);
		phy_angular_velocity = approach(phy_angular_velocity, 0, 40);
	}
}