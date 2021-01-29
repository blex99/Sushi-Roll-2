function game_goto_next_level(){
	
	// shouldn't be able to skip levels by mashing A
	if (oTransition.mode != TRANS_MODE.OFF) return;
	
	with (oGame)
	{
		level_index = (level_index + 1) % array_length(levels);
		transition_start(levels[level_index]);
		level_first_try = true;
	}
}

function game_goto_first_level()
{
	with (oGame) level_index = -1;
	game_goto_next_level();
}

function game_get_ideal_width()
{
	with (oGame) return ideal_width;
	return BASE_W;
}

function game_get_ideal_height()
{
	with (oGame) return ideal_height;
	return BASE_H;
}

function game_resize_window()
{
	with (oGame)
	{
		surface_resize(application_surface, ideal_width, ideal_height);
		
		display_set_gui_size(ideal_width * gui_scale, ideal_height * gui_scale);
		
		if (!window_get_fullscreen())
		{
			window_set_size(ideal_width * window_scale, ideal_height * window_scale);
			alarm[0] = 2; // center window
		}
	}
}

// either increase or decrease the gui's scale
function game_set_gui_scale(_increment)
{
	with (oGame)
	{
		if (_increment) gui_scale += 0.5;
		else			gui_scale -= 0.5;
	
		var _max_scale = window_get_fullscreen() ? window_scale_max : window_scale;
		
		gui_scale = clamp(gui_scale, 1, _max_scale);
		display_set_gui_size(ideal_width * gui_scale, ideal_height * gui_scale);
	}
}

// either increase or decrease the window's scale
function game_set_window_scale(_increment)
{
	if (window_get_fullscreen())
	{
		return;
	}
	
	with (oGame)
	{
		if (_increment) window_scale += 1;
		else			window_scale -= 1;
		
		window_scale = clamp(window_scale, 1, window_scale_max);
		gui_scale = clamp(gui_scale, 1, window_scale);
	}
	
	game_resize_window();
}