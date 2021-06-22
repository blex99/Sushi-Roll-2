/// @description checks if level complete and paused

ui_alpha = max(ui_alpha - (1 / room_speed), 0);
var _can_skip = (debug_mode || !oGame.level_first_try);
var _input_one = input_one_pressed();
var _input_pause = input_pause_pressed();

if (_input_one && level_is_state(LEVEL.COUNTING_DOWN) && _can_skip)
{
	// skip the timer to play the level
	info_box_create("Skipped Countdown!");
	timer_set_zero();
}

// pause only if you're either playing or paused
if (_input_pause)
{
	if (level_is_state(LEVEL.PLAYING) ||level_is_state(LEVEL.PAUSED))
	{
		level_toggle_pause();
	}
	else
	{
		info_box_create("Cannot pause right now");
	}
}

if (level_is_state(LEVEL.PLAYING) && !global.using_controller)
{
	input_clamp_mouse();
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