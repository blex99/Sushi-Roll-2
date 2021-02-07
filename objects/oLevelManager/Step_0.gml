/// @description checks if level complete and paused

ui_alpha = max(ui_alpha - (1 / room_speed), 0);

if (input_one_pressed())
{
	if (state == LEVEL.COMPLETE)
		game_goto_next_level();
	else if (state == LEVEL.COUNTING_DOWN && (debug_mode || !oGame.level_first_try))
		timer_set_zero();
}

if (input_start_pressed() || (!debug_mode && !paused && os_is_paused()))
	level_toggle_pause();
	
/*
var _state;
switch (state)
{
	case (LEVEL.PANNING_TO_SUSHI):	_state = "PANNING_TO_SUSHI";	break;
	case (LEVEL.COUNTING_DOWN):		_state = "COUNTING_DOWN";		break;
	case (LEVEL.PLAYING):			_state = "PLAYING";				break;
	case (LEVEL.TIME_OUT):			_state = "TIME_OUT";			break;
	case (LEVEL.COMPLETE):			_state = "COMPLETE";			break;
}
add_to_debug_map("level state: " + _state);
*/