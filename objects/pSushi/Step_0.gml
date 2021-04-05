/// @description control the sushi x and spin

if (level_is_state(LEVEL.PAUSED)) exit;

#region control the sushi

var _cam_deg = camera_get_deg();
var _sushi_dir, _force_x, _force_y;

if (global.using_controller)
{
	_sushi_dir = gamepad_axis_value(global.device_index, gp_axislh);
}
else
{
	var _left_key	= keyboard_check(ord("A"));
	var _right_key	= keyboard_check(ord("D"));
	
	_sushi_dir = _right_key - _left_key;
}


_force_x = lengthdir_x(force, _cam_deg) * _sushi_dir;
_force_y = -1 * lengthdir_y(force, _cam_deg) * _sushi_dir;
physics_apply_force(x, y, _force_x, _force_y);
physics_apply_torque(_sushi_dir * torque);

#endregion

#region water interaction
if (place_meeting(x, y, oWaterBody))
{
	var _water = instance_place(x, y, oWaterBody);
	water_cause_wave(_water, x);
	phy_linear_damping = 5;
}
else
{
	phy_linear_damping = linear_damp;
}
#endregion

jump_buffer = max(0, jump_buffer - 1);