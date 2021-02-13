/// @desc control platforms and mouse

var _controller = global.using_controller;
var _target_angle, _spd, _diff;

// stats for the WINDOW
w = window_get_width();
h = window_get_height();
w_half = w * 0.5;
h_half = h * 0.5;
max_range = w * 0.1;
w_min = w_half - max_range;
w_max = w_half + max_range;

// clamp mouse to w_min and w_max
if (!_controller && !level_is_state(LEVEL.COMPLETE))
	window_mouse_set(input_x_mouse_clamp(w_min, w_max), h_half);

// rotate
_target_angle = input_x_axis() * rot_limit;
_diff = angle_difference(_target_angle, phy_rotation);
_spd = _diff * rot_strength;
_spd = clamp(_spd, -speed_max, speed_max);

phy_angular_velocity = _spd;


/*
_target_angle = input_x_axis() * rot_limit;
var _diff = angle_difference(_target_angle, phy_rotation);

var _spin =  rot_strength * _diff / rot_limit;
if (abs(_diff) > 1) physics_apply_angular_impulse(_spin);

add_to_debug_map("_diff: " + string(_diff));

*/