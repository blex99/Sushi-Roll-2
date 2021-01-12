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

add_to_debug_map("force: " + string(force));
add_to_debug_map("mass: " + string(phy_mass));