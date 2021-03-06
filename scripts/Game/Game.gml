// saves and closes the game
function game_close()
{
	with (oGame) alarm[1] = room_speed / 2;
	data_game_save();
	transition_start(rEnd);
}

#region goto's
	// (upon beating a level,) move back to the main
	// menu. also save the game
	function game_goto_menu_level()
	{
		// shouldn't be able to skip levels by mashing A
		if (oTransition.mode != TRANS_MODE.OFF) return;
	
		with (oGame)
		{
			level_first_try = true;
		
			// check if you've unlocked a new difficulty
			if (data_get_num_levels_beaten(area_index) >= AREA_UNLOCK_REQ &&
				data_get_area_completed(area_index) == false)
			{
				data_set_area_completed(area_index, true);
				var _str = "";
				var _next_area = area_index + 1;
				if (_next_area < LEVEL_AREA.COUNT)
				{
					data_set_area_unlocked(_next_area, true);
					_str += area2str(_next_area) + " levels are unlocked.";
				}
			
				info_box_create(_str);
			}
		
			transition_start(menu_level_rooms[area_index]);
		}
	}

	// goto specifed level
	function game_goto_level(_area_index, _level_index)
	{
		// shouldn't be able to skip levels by mashing A
		if (oTransition.mode != TRANS_MODE.OFF) return;
	
		with (oGame)
		{
			area_index = _area_index;
			level_index = _level_index % array_length(levels[area_index]);
			transition_start(levels[area_index][level_index].room_name);

			// center mouse to prevent clicking outside game accidentally
			if (!input_using_controller())
			{
				window_mouse_set(GUI_W / 2, GUI_H / 2);
				window_set_cursor(cr_none);
			}

			level_first_try = true;
		}
	}

	// goto specifed level
	function game_goto_next_level()
	{
		// shouldn't be able to skip levels by mashing A
		if (oTransition.mode != TRANS_MODE.OFF) return;
	
		with (oGame)
		{
			level_index = (level_index + 1) % array_length(levels[area_index]);
		
			// if you've wrapped around, meaning there is no next level...
			if (level_index == 0)
			{
				area_index = (area_index + 1) % array_length(levels);
			
				// if you've wrapped around AGAIN, you've completed the last level
				if (area_index == 0)
				{
					transition_start(rMenuAreaSelect);
					return;
				}
			}
		
			game_goto_level(area_index, level_index);
		}
	}
#endregion

#region window/display
	function game_win_toggle_fullscreen()
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
	
		input_update_window_stats();
		surface_resize(application_surface, BASE_W, BASE_H);
	}

	// increase and wrap the window's scale
	function game_increment_window_scale()
	{
		if (window_get_fullscreen()) return;
	
		with (oGame)
		{
			window_scale += 1;
			if (window_scale > window_scale_max) window_scale = 1;
		}
	
		game_resize_window();
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
		}
	
		input_update_window_stats();
		surface_resize(application_surface, BASE_W, BASE_H);
	}
#endregion

function game_get_area_index()
{
	with (oGame)
	{
		return area_index;
	}
}

// get level struct (NOT the save data)
// this struct contains the name, room id, and time goal
function game_get_level(_area, _index)
{
	with (oGame) return levels[_area][_index];
}
