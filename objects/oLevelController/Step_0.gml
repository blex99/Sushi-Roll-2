/// @desc control platforms and sushi's x velocity

click = mouse_check_button_pressed(mb_left);

if (click)
{
	xrotateable = mouse_x;
	yrotateable = mouse_y;
}

rot_input = clamp(window_mouse_get_x(), w_min, w_max);
var _normalized_input = (2 * (rot_input - w_min) / (w_max - w_min)) - 1;
var _rot = instance_nearest(xrotateable, yrotateable, pRotateable);

// rotating object idle
with (pRotateable)
{
	phy_angular_velocity = 0;
}

// ...except for the one selected
with (_rot)
{
	var _target_angle = _normalized_input* _rot.angle_limit;
	var _spd = (_target_angle - phy_rotation) * other.rot_strength;
	phy_angular_velocity = _spd;
}

// control the sushi x velocity
with (sushi_cur())
{
	phy_linear_velocity_x += _normalized_input * 2;
}