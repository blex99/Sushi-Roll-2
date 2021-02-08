/// @description control the sushi x velocity

var _x_dir;

if (global.using_controller)
{
	_x_dir = gamepad_axis_value(global.device_index, gp_axislh);
}
else
{
	var _left = keyboard_check(ord("A"));
	var _right = keyboard_check(ord("D"));
	_x_dir = _right - _left;
}

force = _x_dir * 
	((sign(_x_dir) != sign(phy_linear_velocity_x)) ? force_bonus : force_normal);

force = clamp(force, -force_max, force_max);
phy_linear_velocity_x += force;
physics_apply_torque(force * 20);

if (place_meeting(x, y, oWaterBody))
{
	var _water = instance_place(x, y, oWaterBody);
	water_cause_wave(_water, x);
	phy_linear_damping = 5;
}