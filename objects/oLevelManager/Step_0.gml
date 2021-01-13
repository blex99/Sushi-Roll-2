/// @description checks if level complete and paused

ui_alpha = max(ui_alpha - (1 / room_speed), 0);

if (level_complete)
{
	if (input_one_pressed()) game_goto_next_level();
}
else
{
	if (input_start_pressed())			level_toggle_pause();
	if (paused && input_one_pressed())	room_restart();
}

if (debug_mode && level_counting_down() && input_one_pressed())
{
	// speed up countdown...
	alarm[0] = 1;
	ui_alpha = 0;
}