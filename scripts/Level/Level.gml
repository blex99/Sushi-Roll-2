// create a level struct
function level_create(_level_name, _room_name, _time_sec_req, _best_time_mus,
	_best_score, _has_beaten, _death_counter)
{
	if (0) return argument[0];
	if (_has_beaten == undefined)		_has_beaten = false;
	if (_death_counter == undefined)	_death_counter = 0;
	if (_best_time_mus == undefined)	_best_time_mus = sec2mus(90);
	if (_best_score == undefined)		_best_score = 0;
	
	var _level = 
	{
		level_name : _level_name,
		room_name : _room_name,
		time_sec_req : _time_sec_req, // time second requirement
		best_time_mus : _best_time_mus,
		best_score : _best_score,
		has_beaten : _has_beaten,
		death_counter : _death_counter, // total number of times player died
	};
	return _level;
}

// returns the number STRING of the level based off the room name
// EX: rLevelBeg01 -> "01"
function level_get_number(_room_id)
{
	var _room_str = room_get_name(_room_id);
	var _room_str_len = string_length(_room_str);
	return	string_char_at(_room_str, _room_str_len - 1) +
			string_char_at(_room_str, _room_str_len);
}

function level_completed(){
	with (oLevelManager)
	{
		state = LEVEL.COMPLETE;
		physics_pause_enable(true);
		timer_freeze();
		stats_calc_final_score();
		game_update_cur_level_struct();
		instance_create_depth(0, 0, -9999, oVictoryScreen);
		if (!global.using_controller) window_set_cursor(cr_default);
	}
}

function level_toggle_pause()
{	
	with (oLevelManager)
	{
		if (!level_is_state(LEVEL.PAUSED))
		{
			// pausing
			prev_state = state;
			state = LEVEL.PAUSED;
			
			physics_pause_enable(true);
			
			// create menu
			instance_create_layer(0, 0, "Instances", oMenuPause);
			
			// show mouse and center its position
			window_mouse_set(window_get_width() / 2, window_get_height() / 4);
			if (!global.using_controller) window_set_cursor(cr_default);
		}
		else
		{
			// unpausing
			state = prev_state;
			
			physics_pause_enable(false);
			
			instance_destroy(oMenuPause);
			
			window_set_cursor(cr_none);
		}
	}
}

function level_start_countdown()
{
	with (oLevelManager)
	{
		state = LEVEL.COUNTING_DOWN;
		timer_create(sec2mus(3), true, level_begin);
	}
}

// creates timer remove invisible thing
function level_begin()
{
	with (oLevelManager)
	{
		state = LEVEL.PLAYING;
		ui_alpha = ui_alpha_start;
		timer_create(0, false);
	}
	
	instance_destroy(oInvisibleSushiHolder);
}


function level_is_state(_level_state)
{
	with (oLevelManager)
		return state == _level_state;
}