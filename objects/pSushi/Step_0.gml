/// @description control the sushi x velocity

var _target = 0;
if (!input_one())
{	
	// more force if against the velocity
	if (sign(input_x_axis()) != sign(phy_linear_velocity_x))
		_target = force_bonus * input_x_axis();
	else
		_target = force_normal * input_x_axis();
}

force = approach(force, _target, 0.5);
force = clamp(force, -force_max, force_max);
phy_linear_velocity_x += force;

if (place_meeting(x, y, oWaterBody))
{
	water_cause_wave(instance_place(x, y, oWaterBody), x);
	phy_linear_damping = 5;
}