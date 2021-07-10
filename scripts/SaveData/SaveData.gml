function data_init()
{
	total_rice = 0;
	start_fullscreen = false;
	music_volume = 0.6;
	sfx_volume = 0.6;

	// player stats for each level
	levels_sd = array_create(LEVEL_AREA.COUNT);
	for (var i = 0; i < LEVEL_AREA.COUNT; i++)
	{
		levels_sd[i] = array_create(MAX_LEVELS_PER_AREA);
		for (var j = 0; j < MAX_LEVELS_PER_AREA; j++)
			levels_sd[i][j] = level_sd_create();
	}

	// by default, no level types have been completed
	areas_completed = array_create(LEVEL_AREA.COUNT);
	for (var i = 0; i < LEVEL_AREA.COUNT; i++)
		areas_completed[i] = false;

	// by default, only kitchen is availible
	areas_unlocked = array_create(LEVEL_AREA.COUNT);
	areas_unlocked[LEVEL_AREA.KITCHEN] = true;
	for (var i = 1; i < LEVEL_AREA.COUNT; i++)
		areas_unlocked[i] = false;

	// load data
	if (global.debug.load_data) data_game_load();

	// unlock all levels, if desired
	if (global.debug.unlock_all)
	{
		for (var i = 0; i < LEVEL_AREA.COUNT; i++)
		{
			areas_unlocked[i] = true;
			areas_completed[i] = true;
		}
	}
}

// save the game data
// NOTE: cannot call it game_save();
function data_game_save()
{
	var _saveData = [];
	
	with (oSaveData)
	{
		array_push(_saveData,
			levels_sd,
			areas_unlocked,
			areas_completed,
			window_get_fullscreen(),
			music_volume,
			sfx_volume,
			total_rice,
		);
	}

	var _string = json_stringify(_saveData);
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, "save.sav");
	buffer_delete(_buffer);
	
	info_box_create("Saved Data");
}

// load the game data
function data_game_load()
{
	if (!file_exists("save.sav")) return;

	var _buffer = buffer_load("save.sav");
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);

	var _loadData = json_parse(_string);

	with (oSaveData)
	{
		levels_sd			= _loadData[0];
		areas_unlocked		= _loadData[1];
		areas_completed		= _loadData[2];
		start_fullscreen	= _loadData[3];
		music_volume		= _loadData[4];
		sfx_volume			= _loadData[5];
		total_rice			= _loadData[6];
		
		jukebox_set_music_volume(music_volume);
		jukebox_set_sfx_volume(sfx_volume);
	}

	info_box_create("Data Loaded");
}

// delete save file and call oGame's create event
// see rMenuOptions
function data_clear_save()
{
	if (show_question("Are you sure?"))
	{
		if (file_exists("save.sav")) file_delete("save.sav");
		
		data_init();
		
		info_box_create("Cleared ALL save data.");
		
		transition_start(global.debug.starting_room);
	}
}

#region getters
	function data_get_rice_total_count()
	{
		with (oSaveData) return total_rice;
	}

	function data_get_start_fullscreen()
	{
		with (oSaveData) return start_fullscreen;
	}

	function data_get_start_music_volume()
	{
		with (oSaveData) return music_volume;
	}

	function data_get_start_sfx_volume()
	{
		with (oSaveData) return sfx_volume;
	}
	
	function data_get_area_completed(_area_index)
	{
		with (oSaveData) return areas_completed[_area_index];
	}
	
	function data_get_area_unlocked(_area_index)
	{
		with (oSaveData) return areas_unlocked[_area_index];
	}
	
	function data_get_level_save_data(_area_index, _level_index)
	{
		with (oSaveData) return levels_sd[_area_index][_level_index];
	}

	// number of beaten levels in a specific area
	function data_get_num_levels_beaten(_area_index)
	{
		with (oSaveData)
		{
			var _len = array_length(levels_sd[_area_index]);
			var _num = 0;
			for (var i = 0; i < _len; i++)
			{
				if (levels_sd[_area_index][i].has_beaten) _num++;
			}
			return _num;
		}
	}
#endregion

#region setters
	function data_set_rice_total_count(_value)
	{
		with (oSaveData) total_rice = _value;
	}
	
	function data_set_level_beaten(_area_index, _level_index)
	{
		with (oSaveData)
		{
			// indicate you've beaten it
			levels_sd[_area_index][_level_index].has_beaten = true;
		}
	}
	
	function data_set_area_completed(_area_index, _value)
	{
		with (oSaveData)
		{
			areas_completed[_area_index] = _value;
		}
	}
	
	function data_set_area_unlocked(_area_index, _value)
	{
		with (oSaveData)
		{
			areas_unlocked[_area_index] = _value;
		}
	}
	
	function data_set_volumes(_music_vol, _sfx_vol)
	{
		with (oSaveData)
		{
			music_volume = _music_vol;
			sfx_volume = _sfx_vol;
		}
	}
#endregion

