function game_goto_next_level(){
	
	// shouldn't be able to skip levels by mashing A
	if (oTransition.mode != TRANS_MODE.OFF) return;
	
	with (oGame)
	{
		level_index = (level_index + 1) % array_length(levels);
		transition_start(levels[level_index]);
	}
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

function game_set_window_scale(_scale)
{
	if (window_get_fullscreen()) return;
	
	with (oGame)
	{
		_scale = clamp(_scale, 1, window_scale_max);
		window_scale = _scale;
		gui_scale = clamp(gui_scale, 1, window_scale);
	}
	
	game_resize_window();
}

function game_resize_window()
{
	with (oGame)
	{
		surface_resize(application_surface, ideal_width * window_scale, ideal_height * window_scale);
		
		display_set_gui_size(ideal_width * gui_scale, ideal_height * gui_scale);
		
		if (!window_get_fullscreen())
		{
			window_set_size(ideal_width * window_scale, ideal_height * window_scale);
			alarm[0] = 1; // center window
		}
	}
}