/// @description open trap soon

// start timer
if (state == trap_door_state_idle)
{
	state = trap_door_state_move_soon;
	move_timer = move_timer_start;
	rot_target = 90;
}