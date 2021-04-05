/// @description checks if level complete and paused

ui_alpha = max(ui_alpha - (1 / room_speed), 0);

if (input_one_pressed())
{
	if (level_is_state(LEVEL.COMPLETE))
	{
		game_goto_menu_level();
	}
	else if (level_is_state(LEVEL.COUNTING_DOWN) && (debug_mode || !oGame.level_first_try))
	{
		info_box_create("Skipped Countdown!");
		timer_set_zero();
	}
}

if (!level_is_state(LEVEL.COMPLETE))
{
	if (input_pause_pressed())
	{
		level_toggle_pause();
	}
	
	if (!global.using_controller)
	{
		input_clamp_mouse();
	}
} 

/*
var _state;
switch (state)
{
	case (LEVEL.PANNING):			_state = "PANNING";				break;
	case (LEVEL.COUNTING_DOWN):		_state = "COUNTING_DOWN";		break;
	case (LEVEL.PLAYING):			_state = "PLAYING";				break;
	case (LEVEL.PAUSED):			_state = "PAUSED";				break;
	case (LEVEL.COMPLETE):			_state = "COMPLETE";			break;
}
add_to_debug_map("level state: " + _state);
*/