// trap door state machine

// s -> state
// idle state
function s_trap_idle()
{
	physics_joint_set_value(joint, phy_joint_angle_limits, true);
	image_alpha = 1;
}

function s_trap_down_soon()
{
	image_alpha = oscillate(0.5, 1, 0.25);

	if (move_timer <= 0)
	{
		state = s_trap_moving_down;
		move_timer = move_timer_start;
	}
}

function s_trap_moving_down()
{
	physics_joint_set_value(joint, phy_joint_angle_limits, false);
	image_alpha = 1;

	rotate_towards(90);

	// you've reached your target at this point
	if (move_timer <= 0)
	{
		state = s_trap_up_soon;
		move_timer = move_timer_start;
	}
}

function s_trap_up_soon()
{
	image_alpha = oscillate(0.5, 1, 0.25);

	rotate_towards(90);

	if (move_timer <= 0)
	{
		state = s_trap_moving_up;
		move_timer = move_timer_start;
	}
}

function s_trap_moving_up()
{
	image_alpha = 1;

	var _diff = rotate_towards(0);

	// if you've reached your target
	// or after a certain amt of time...
	if (move_timer <= 0 || abs(_diff) < 1)
	{
		state = s_trap_idle;
		move_timer = -1; // set timer to be inactive
	}
}

// move towards target angle
// returns difference between target angle and current angle
function rotate_towards(_angle)
{
	var _angle_diff = angle_difference(phy_rotation, _angle);
	phy_angular_velocity = -_angle_diff * rot_strength;
	return _angle_diff;
}













