/// @desc control platforms

// clamp mouse to w_min and w_max
window_mouse_set(input_x_mouse_clamp(w_min, w_max), h_half); 

// rotating object idle
with (pRotateable)
{
	var _target_angle;
	if (input_one())	 _target_angle = input_x_axis() * angle_limit;
	else				 _target_angle = 0;
	
	var _spd = (_target_angle - phy_rotation) * other.rot_strength;
	if (input_controller_active()) _spd *= 0.75; // reduce spd with controller
	phy_angular_velocity = _spd;
}


