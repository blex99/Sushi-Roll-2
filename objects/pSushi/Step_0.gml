/// @description control the sushi x velocity

if (!input_one())
{
	var _move_force_dir = input_x_axis() * move_force;
	
	// twice the force if against the velocity
	if (sign(input_x_axis()) != sign(phy_linear_velocity_x))
		_move_force_dir *= 4;
		
	phy_linear_velocity_x += _move_force_dir;
	
	add_to_debug_map("force: " + string(_move_force_dir));
	add_to_debug_map("mass: " + string(phy_mass));
}