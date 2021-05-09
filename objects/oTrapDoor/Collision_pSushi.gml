/// @description open trap soon

// start timer
if (state == s_trap_idle)
{
	state = s_trap_down_soon;
	move_timer = move_timer_start;
}