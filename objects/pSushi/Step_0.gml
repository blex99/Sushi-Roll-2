/// @description control the sushi x and spin

if (level_is_state(LEVEL.PAUSED)) exit;

var _x_dir;
var _g_dir = phys_world_get_gravity();

if (global.using_controller)
	_x_dir = gamepad_axis_value(global.device_index, gp_axislh);
else
{
	var _left;	
	var _right;	
	
	// "A" will be at the left if the gravity is down or right???
	switch (_g_dir)
	{
		case DIR.D: case DIR.R:
			_left = keyboard_check(ord("A"));
			_right = keyboard_check(ord("D"));
			break;
		case DIR.U: case DIR.L:
			_left = keyboard_check(ord("D"));
			_right = keyboard_check(ord("A"));
			break;
	}
	_x_dir = _right - _left;
}

// control the sushi
switch (_g_dir)
{
	case DIR.L: case DIR.R:
		physics_apply_force(x, y, 0, -_x_dir * force);
		break;
	case DIR.U: case DIR.D:
		physics_apply_force(x, y, _x_dir * force, 0);
		break;
}


// up direction applies counter clockwise torque
//physics_apply_torque(_x_dir * torque);

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

jump_buffer = max(0, jump_buffer - 1);
add_to_debug_map("jump_buffer: " + string(jump_buffer));