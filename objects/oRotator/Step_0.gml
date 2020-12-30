var _space = false;
if (keyboard_check(vk_space)) _space = true;


xmouse = clamp(window_mouse_get_x(), w_min, w_max);

if (enabled_deadzone && xmouse > xdeadzone_min && xmouse < xdeadzone_max)
	reset_ragdoll(2);
else if (_space)
	with (oRagdollCore) phy_angular_velocity = 0;
else
	rotate_ragdoll(xmouse, w_min, w_max, angular_spd);