/// @description jump timers

jump_buffer = max(-1, jump_buffer - 1);

if (jump_buffer < 0 && input_one_pressed() && sushi_is_grounded())
{
	jump_buffer = jump_buffer_start;
	sushi_jump(200);
}

add_to_debug_map("velocity: (" + string(floor(phy_linear_velocity_x)) + ", " + string(floor(phy_linear_velocity_y)) + ")");
add_to_debug_map("jump_buffer: " + string(jump_buffer));