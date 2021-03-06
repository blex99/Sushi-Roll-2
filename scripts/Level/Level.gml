// create a level struct
function level_create(_level_name, _room_name, _time_sec_goal)
{
	if (0) return argument[0];
	
	var _level = 
	{
		level_name		: _level_name,
		room_name		: _room_name,
		time_sec_goal	: _time_sec_goal, // time second requirement
	};
	
	return _level;
}

function level_sd_create(_best_time_mus, _has_beaten, _death_counter,
	_collected_orange, _collected_wasabi)
{
	if (0) return argument[0];

	// default values...
	if (_has_beaten == undefined)		_has_beaten = false;
	if (_death_counter == undefined)	_death_counter = 0;
	if (_best_time_mus == undefined)	_best_time_mus = sec2mus(999);
	if (_collected_orange == undefined)	_collected_orange = false;
	if (_collected_wasabi == undefined)	_collected_wasabi = false;

	var _level = 
	{
		best_time_mus		: _best_time_mus,
		has_beaten			: _has_beaten,
		death_counter		: _death_counter, // num times player died
		collected_orange	: _collected_orange,
		collected_wasabi	: _collected_wasabi,
	};
	
	return _level;
}

function level_completed()
{
	with (oLevelManager)
	{
		state = LEVEL.COMPLETE;
		physics_pause_enable(true);
		timer_freeze();
		data_set_level_beaten(area_index, level_index);
		
		// times updated in victory screen
		instance_create_depth(0, 0, -9999, oMenuVictoryScreen);
		if (!input_using_controller()) window_set_cursor(cr_default);
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
			instance_create_layer(0, 0, "Instances", oMenuPause);
			
			// preform moving platform pause event
			with (oMovingPlatform) event_user(0);
			
			with (oCamera)
			{
				zoom_target_prev = zoom_target;
				zoom_target = 1.5;
			}
			
			// display mouse, if using keyboard/mouse
			if (!input_using_controller())
				window_set_cursor(cr_default);
			
			// show mouse and revert its position to last known pos
			window_mouse_set(prev_mouse.x, prev_mouse.y);
		}
		else
		{
			// unpausing
			state = prev_state;
			physics_pause_enable(false);
			instance_destroy(oMenuPause);
			window_set_cursor(cr_none);
			
			// preform moving platform unpause event
			with (oMovingPlatform) event_user(0);
			
			with (oCamera)
			{
				zoom_target = zoom_target_prev;
			}
			
			// remember mouse position
			var _mx = window_mouse_get_x();
			var _my = window_mouse_get_y();
			prev_mouse = Vector2(_mx, _my);
		}
	}
}

function level_start_countdown()
{
	with (oLevelManager)
	{
		state = LEVEL.COUNTING_DOWN;
	}

	with (oCamera)
	{
		path_position = 1;
		zoom_target = 1;
	}

	timer_create(sec2mus(3), true, level_begin);
}

function level_begin()
{
	// creates timer remove invisible thing
	with (oLevelManager)
	{
		state = LEVEL.PLAYING;
		ui_alpha = ui_alpha_start;
	}
	
	timer_create(0, false);
	instance_destroy(oInvisibleSushiHolder);
}

#region getters

	function level_is_state(_level_state)
	{
		if (!instance_exists(oLevelManager)) return false;

		with (oLevelManager)
			return state == _level_state;
	}

	function level_get_death_count()
	{
		with (oLevelManager) return level_sd.death_counter;
	}

	function level_is_orange_collected()
	{
		with (oLevelManager) return level_sd.collected_orange;
	}

	// returns best time
	function level_get_best_time()
	{
		with (oLevelManager) return level_sd.best_time_mus;
	}
	
	function level_is_wasabi_collected()
	{
		with (oLevelManager) return level_sd.collected_wasabi;
	}

	function level_got_all_collectibles()
	{
		return level_is_orange_collected() && level_is_wasabi_collected();
	}

#endregion

#region setters

	function level_set_orange_collected()
	{
		with (oLevelManager) level_sd.collected_orange = true;
	}
	
	// takes the current time and checks if it's less than the cur best time
	function level_update_best_time()
	{
		var _cur_time = timer_get_time();
		with (oLevelManager)
		{
			if (level_sd.best_time_mus > _cur_time)
				level_sd.best_time_mus = _cur_time;
		}
	}
	
	function level_set_wasabi_collected()
	{
		with (oLevelManager) level_sd.collected_wasabi = true;
	}

	function level_increment_death_counter()
	{
		with (oLevelManager) level_sd.death_counter++;
	}
#endregion