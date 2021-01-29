/// @desc control platforms

// rotating object idle
with (pRotateable)
{
	var _target_angle;

	if (input_one())	 _target_angle = input_x_axis() * ROT_LIMIT;
	else				 _target_angle = 0;
	
	//_target_angle = input_x_axis() * ROT_LIMIT;
	
	var _spd = (_target_angle - phy_rotation) * other.rot_strength;
	phy_angular_velocity = _spd;
}

// clamp mouse to w_min and w_max
if (!global.using_controller && !is_level_complete())
	window_mouse_set(input_x_mouse_clamp(w_min, w_max), h_half);