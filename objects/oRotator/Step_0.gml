var _target_angle = 0;
var _spd = 0;

space = keyboard_check(vk_space);
xmouse = clamp(window_mouse_get_x(), w_min, w_max);


if (enabled_deadzone && xmouse > xdeadzone_min && xmouse < xdeadzone_max)
{
	reset_ragdoll(2);
}
else
{
	_target_angle = (xmouse - w_min) / (w_max - w_min);
	_target_angle *= 2;
	_target_angle -= 1;
	_target_angle *= angle_limit;
	_spd = (_target_angle - oRagdollCore.phy_rotation) * angular_spd_mult;
	oRagdollCore.phy_angular_velocity = _spd;
}

if (space)
{
	// freeze the ragdoll
	with (oRagdollCore) phy_angular_velocity = 0;
	with (pRagdoll) image_blend = c_blue;
}
else
{
	with (pRagdoll) image_blend = c_white;	
}

add_to_debug_map("_spd: " + string(_spd));
add_to_debug_map("target_angle: " + string(_target_angle));
add_to_debug_map("current angle: " + string(oRagdollCore.phy_rotation));