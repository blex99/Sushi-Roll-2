// show/hide cursor based of if using_controller
function update_cursor()
{
	var _cursor = cr_default;
	if (global.using_controller) _cursor = cr_none;
	if (instance_exists(oLevelManager) && !level_is_state(LEVEL.COMPLETE)) _cursor = cr_none;
	
	window_set_cursor(_cursor);	
}

function game_goto_next_level()
{
	// shouldn't be able to skip levels by mashing A
	if (oTransition.mode != TRANS_MODE.OFF) return;
	
	with (oGame)
	{
		level_index++;
		level_first_try = true;
		
		if (level_index >= array_length(levels[diff_index]))
			transition_start(rMenuMain);
		else
			transition_start(levels[diff_index][level_index].room_name);
	}
}

// goto specifed level
function game_goto_level(_difficulty, _level)
{
	// shouldn't be able to skip levels by mashing A
	if (oTransition.mode != TRANS_MODE.OFF) return;
	
	with (oGame)
	{
		diff_index = _difficulty;
		level_index = _level % array_length(levels[diff_index]);
		transition_start(levels[diff_index][level_index].room_name);
		level_first_try = true;
	}
}

function game_resize_window()
{
	with (oGame)
	{
		if (!window_get_fullscreen())
		{
			window_set_size(BASE_W * window_scale, BASE_H * window_scale);
			alarm[0] = 2; // center window
		}
		
		surface_resize(application_surface, BASE_W, BASE_H);
	}
}

function toggle_fullscreen()
{
	window_set_fullscreen(!window_get_fullscreen());
	
	var _scale;
	with (oGame)
	{
		if (window_get_fullscreen())
			_scale = window_scale_max;
		else
		{
			_scale = window_scale;
			window_set_size(BASE_W * _scale, BASE_H * _scale);
			alarm[0] = 2;// center window
		}
	}
	
	surface_resize(application_surface, BASE_W, BASE_H);
}

// either increase or decrease the window's scale
function game_set_window_scale(_increment)
{
	if (window_get_fullscreen()) return;
	
	with (oGame)
	{
		if (_increment) window_scale += 1;
		else			window_scale -= 1;
		
		window_scale = clamp(window_scale, 1, window_scale_max);
		gui_scale = clamp(gui_scale, 1, window_scale);
	}
	
	game_resize_window();
}

function game_update_cur_stats()
{
	with (oGame)
	{
		var _score = stats_get_score();
		var _time = timer_get_time();
		var _best_score = levels[diff_index][level_index].best_score;
		var _best_time = levels[diff_index][level_index].best_time_mus;
				
		// if you've beaten your highest score
		if (_best_score < _score)
			levels[diff_index][level_index].best_score = _score;
			
		// if you've beaten your best time
		if (_best_time > _time)
			levels[diff_index][level_index].best_time_mus = _time;
		
		// TODO SAVE??
	}
}