/// @desc control platforms and sushi's x velocity

// check for platforms in the area
if (input_two())
{
	with (pRotateable) active = in_range;
}

// rotating object idle
with (pRotateable)
{
	if (active)
	{
		var _target_angle = input_x_axis() * angle_limit;
		var _spd= (_target_angle - phy_rotation) * other.rot_strength;
		
		if (input_controller_active()) _spd *= 0.75; // reduce spd with controller
		
		phy_angular_velocity = _spd;
	}
	else
	{
		phy_angular_velocity = 0;
	}
}

// control the sushi x velocity
with (sushi_cur())
{
	phy_linear_velocity_x += input_x_axis() * 1.25;
}