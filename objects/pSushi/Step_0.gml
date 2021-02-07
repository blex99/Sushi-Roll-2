/// @description control the sushi x velocity

var _target = 0;
var _delta = 0.5;

if (!input_one())
{	
	var _x_dir = sign(input_x_axis());
	
	// more force if against the velocity
	_target = _x_dir * 
		((_x_dir != sign(phy_linear_velocity_x)) ? force_bonus : force_normal);
		
	add_to_debug_map("_target: " + string(_target));
	
}

force = _target;
//force = approach(force, _target, _delta);
force = clamp(force, -force_max, force_max);
phy_linear_velocity_x += force;

if (place_meeting(x, y, oWaterBody))
{
	var _water = instance_place(x, y, oWaterBody);
	water_cause_wave(_water, x);
	phy_linear_damping = 5;
}