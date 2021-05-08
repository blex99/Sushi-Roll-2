// TODO make not move when about to move upwards


function trap_door_state_idle()
{
	physics_joint_set_value(joint, phy_joint_angle_limits, true);
	
	image_alpha = 1;
	
	add_to_debug_map("state: " + string("1"));
}

function trap_door_state_move_soon()
{
	image_alpha = oscillate(0.5, 1, 0.25);
	
	move_timer--;
	if (move_timer <= 0)
	{
		state = trap_door_state_moving;
		move_timer = move_timer_start;
	}
	
	add_to_debug_map("state: " + string("2"));
}

function trap_door_state_moving()
{
	physics_joint_set_value(joint, phy_joint_angle_limits, false);
	image_alpha = 1;
	
	// move towards target angle
	angle_diff = angle_difference(phy_rotation, rot_target);
	phy_angular_velocity = -angle_diff * rot_strength;
	
	// if you've reached your target
	move_timer--;
	if (move_timer <= 0 || abs(angle_diff) < 1)
	{
		phy_angular_velocity = 0;

		// if your target was 0
		if (rot_target == 0)
		{
			state = trap_door_state_idle;
			is_down = false;
		}
		else
		{
			state = trap_door_state_move_soon;
			is_down = true;
			rot_target = 0;
			move_timer = move_timer_start;
		}
	}
	
	add_to_debug_map("state: " + string("3"));
}