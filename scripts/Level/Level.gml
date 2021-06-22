// create a level struct
function level_create(_level_name, _room_name, _time_sec_goal, _best_time_mus,
	_has_beaten, _death_counter)
{
	if (0) return argument[0];
	if (_has_beaten == undefined)		_has_beaten = false;
	if (_death_counter == undefined)	_death_counter = 0;
	if (_best_time_mus == undefined)	_best_time_mus = sec2mus(999);
	
	var _level = 
	{
		level_name : _level_name,
		room_name : _room_name,
		time_sec_goal : _time_sec_goal, // time second requirement
		best_time_mus : _best_time_mus,
		has_beaten : _has_beaten,
		death_counter : _death_counter, // total number of times player died
	};
	return _level;
}

function level_completed(){
	with (oLevelManager)
	{
		state = LEVEL.COMPLETE;
		physics_pause_enable(true);
		timer_freeze();
		game_cur_level_beaten();
		
		// times updated in victory screen
		instance_create_depth(0, 0, -9999, oMenuVictoryScreen);
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
			instance_create_layer(0, 0, "Instances", oMenuPause);
			
			// preform moving platform pause event
			with (oMovingPlatform) event_user(0);
			
			with (oCamera)
			{
				zoom_target_prev = zoom_target;
				zoom_target = 1.5;
			}
			
			// display mouse, if using keyboard/mouse
			if (!global.using_controller)
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

// creates timer remove invisible thing
function level_begin()
{
	with (oLevelManager)
	{
		state = LEVEL.PLAYING;
		ui_alpha = ui_alpha_start;
	}
	
	timer_create(0, false);
	instance_destroy(oInvisibleSushiHolder);
}


function level_is_state(_level_state)
{
	with (oLevelManager)
		return state == _level_state;
}

function level_get_death_count()
{
	with (oLevelManager)
	{
		return level_struct.death_counter;
	}
}

// takes the current time and checks if it's less than the cur best time
function level_update_best_time()
{
	var _cur_time = timer_get_time();
	with (oLevelManager)
	{
		if (level_struct.best_time_mus > _cur_time)
		{
			level_struct.best_time_mus = _cur_time;
		}
	}
}

// returns best time
function level_get_best_time()
{
	with (oLevelManager)
	{
		return level_struct.best_time_mus;
	}
}