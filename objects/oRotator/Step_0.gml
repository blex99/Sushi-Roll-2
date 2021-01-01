if (mouse_check_button_pressed(mb_left))
{
	xmouse = mouse_x;
	ymouse = mouse_y;
}

rot_input = clamp(window_mouse_get_x(), w_min, w_max);

pRotateable.image_alpha = 0.2;

// need this functionality, but buggy
with (pRotateable)
{
	phy_angular_velocity = 0;
	// phy_rotation = approach(phy_rotation, 0, 2);
}

// find nearest pRotateable
var _rot = instance_nearest(xmouse, ymouse, pRotateable)
var _target_angle = (2 * (rot_input - w_min) / (w_max - w_min)) - 1;
_target_angle *= _rot.angle_limit;

_rot.image_alpha = 1;

if (enabled_deadzone && rot_input > xdeadzone_min && rot_input < xdeadzone_max)
{
	with (_rot)
	{
		phy_angular_velocity = 0;
		phy_rotation = approach(phy_rotation, 0, 2);
	}	
}
else
{
	with (_rot)
	{
		var _spd = (_target_angle - phy_rotation) * 5;
		phy_angular_velocity = _spd;
	}	
}