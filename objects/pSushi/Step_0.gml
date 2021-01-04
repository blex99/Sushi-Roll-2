/// @description jump

if (jump_buffer < 0 && input_one() && collision_rectangle(bbox_right,
		bbox_bottom+1, bbox_left, bbox_bottom-1, pPhysicsEntity, 0, 1))
{
	phy_linear_velocity_y += -200;
	jump_buffer = jump_buffer_start;
	sushi_change_size(false); // shrink
	oStats.rice_count--;
}

jump_buffer = max(-1, jump_buffer - 1);

add_to_debug_map("velocity: (" + string(floor(phy_linear_velocity_x)) + ", " + string(floor(phy_linear_velocity_y)) + ")");
add_to_debug_map("jump_buffer: " + string(jump_buffer));