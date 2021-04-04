// show/hide cursor based of if using_controller
function update_cursor()
{
	var _cursor = cr_default;
	if (global.using_controller) _cursor = cr_none;
	if (instance_exists(oLevelManager) && !level_is_state(LEVEL.COMPLETE))
		_cursor = cr_none;
	
	window_set_cursor(_cursor);
}

// (upon beating a level,) move back to either the previous menu or the main
// menu. also save the game
function game_goto_menu_level()
{
	// shouldn't be able to skip levels by mashing A
	if (oTransition.mode != TRANS_MODE.OFF) return;
	
	with (oGame)
	{
		level_first_try = true;
		
		// check if you've unlocked a new difficulty
		if (has_beaten_all_levels_in(diff_index) &&
			diff_completed[diff_index] == false)
		{
			diff_completed[diff_index] = true;
			var _str = diff2str(diff_index) + " levels complete!";
			if (diff_index + 1 < LEVEL_DIFF.COUNT)
			{
				diff_unlocked[diff_index + 1] = true;
				_str += " " + diff2str(diff_index + 1) + " levels are unlocked.";
			}
			
			info_box_create(_str);
			transition_start(rMenuMain);
		}
		else
		{
			transition_start(menu_level_rooms[diff_index]);
		}
		
		my_game_save();
	}
}

// if you've beaten all the levels in a specified difficulty
function has_beaten_all_levels_in(_diff)
{
	with (oGame)
	{
		var _len = array_length(levels[_diff]);
		for (var i = 0; i < _len; i++)
		{
			if (levels[_diff][i].has_beaten == false)
				return false;
		}
		return true;
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

function game_update_cur_level_struct()
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
		
		// indicate you've beaten it
		levels[diff_index][level_index].has_beaten = true;
	}
}

// assuming you're in a level, reset the room
function game_level_room_reset()
{
	with (oGame)
	{
		levels[diff_index][level_index].death_counter++;
	}
	
	my_game_save();
	transition_start();
}

// save the game data
// NOTE: cannot call it game_save();
function my_game_save()
{
	var _saveData = [];
	
	with (oGame)
	{
		// level data, which difficulties you've unlocked and completed
		array_push(_saveData, levels, diff_unlocked, diff_completed);
	}
	
	var _string = json_stringify(_saveData);
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, "save.sav");
	buffer_delete(_buffer);

	info_box_create("Saved Data");
}

// load the game data
function my_game_load()
{
	if (file_exists("save.sav"))
	{
		var _buffer = buffer_load("save.sav");
		var _string = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);
		
		var _loadData = json_parse(_string);
		
		levels = _loadData[0];
		diff_unlocked = _loadData[1];
		diff_completed = _loadData[2];
		
		info_box_create("Loaded Data");
	}
}

























