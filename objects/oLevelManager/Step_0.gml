/// @description checks if level complete and paused

ui_alpha = max(ui_alpha - (1 / room_speed), 0);

if (input_one_pressed())
{
	if (level_complete)				game_goto_next_level();
	else if (paused)				transition_start(room);
	else if (level_counting_down())	alarm[0] = 1;
}

if (input_start_pressed()) level_toggle_pause();