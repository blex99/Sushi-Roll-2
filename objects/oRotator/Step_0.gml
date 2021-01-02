if (mouse_check_button_pressed(mb_left))
{
	xrotateable = mouse_x;
	yrotateable = mouse_y;
}

rot_input = clamp(window_mouse_get_x(), w_min, w_max);
var _rot = instance_nearest(xrotateable, yrotateable, pRotateable);

var _target_angle = (2 * (rot_input - w_min) / (w_max - w_min)) - 1;
_target_angle *= _rot.angle_limit;

with (pRotateable)
{
	phy_angular_velocity = 0;
}

with (_rot)
{
	var _spd = (_target_angle - phy_rotation) * rot_strength;
	phy_angular_velocity = _spd;
}