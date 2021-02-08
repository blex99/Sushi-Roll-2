// show/hide cursor based of if using_controller
function update_cursor()
{
	var _cursor = cr_default;
	if (global.using_controller) _cursor = cr_none;
	if (instance_exists(oLevelManager) && !is_level_complete()) _cursor = cr_none;
	
	window_set_cursor(_cursor);	
}

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

function game_goto_previous_level(){
	
	// shouldn't be able to skip levels by mashing A
	if (oTransition.mode != TRANS_MODE.OFF) return;
	
	with (oGame)
	{
		level_index = (level_index - 1) % array_length(levels);
		transition_start(levels[level_index]);
		level_first_try = true;
	}
}


// goto specifed level
function game_goto_level(_level)
{
	// shouldn't be able to skip levels by mashing A
	if (oTransition.mode != TRANS_MODE.OFF) return;
	
	with (oGame)
	{
		level_index = (_level) % array_length(levels);
		transition_start(levels[level_index]);
		level_first_try = true;
	}
}

function game_resize_window()
{
	with (oGame)
	{
		surface_resize(application_surface, BASE_W, BASE_H);
		display_set_gui_size(BASE_W * gui_scale, BASE_H * gui_scale);
		
		if (!window_get_fullscreen())
		{
			window_set_size(BASE_W * window_scale, BASE_H * window_scale);
			alarm[0] = 2; // center window
		}
	}
}

function toggle_fullscreen()
{
	window_set_fullscreen(!window_get_fullscreen());
	
	with (oGame)
	{
		if (window_get_fullscreen())
			window_set_size(BASE_W * window_scale_max, BASE_H * window_scale_max);
		else
		{
			window_set_size(BASE_W * window_scale, BASE_H * window_scale);
			alarm[0] = 2;
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
		display_set_gui_size(BASE_W * gui_scale, BASE_H * gui_scale);
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