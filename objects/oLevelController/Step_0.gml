/// @desc control platforms and mouse

var _controller = global.using_controller;

// stats for the WINDOW
w = window_get_width();
h = window_get_height();

w_half = w * 0.5;
h_half = h * 0.5;
max_range = w * 0.1;
w_min = w_half - max_range;
w_max = w_half + max_range;

// clamp mouse to w_min and w_max
if (!_controller && !is_level_complete())
	window_mouse_set(input_x_mouse_clamp(w_min, w_max), h_half);

// rotating object idle
with (pRotateable)
{
	var _x, _target_angle, _spd;
	
	if (_controller) _x = gamepad_axis_value(global.device_index, gp_axisrh);
	else _x = input_x_axis();
	
	_target_angle = _x * ROT_LIMIT;
	
	_spd = (_target_angle - phy_rotation) * other.rot_strength;
	phy_angular_velocity = _spd;
}