xmouse = clamp(window_mouse_get_x(), w_min, w_max);
var _target_angle = (2 * (xmouse - w_min) / (w_max - w_min)) - 1;
_target_angle *= angle_limit;

if (enabled_deadzone && xmouse > xdeadzone_min && xmouse < xdeadzone_max)
	reset_ragdoll(2);
else
	rotate_ragdoll(_target_angle, angular_spd_mult);