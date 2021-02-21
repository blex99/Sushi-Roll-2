function level_completed(){
	with (oLevelManager)
	{
		state = LEVEL.COMPLETE;
		physics_pause_enable(true);
		timer_freeze();
		stats_calc_final_score();
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
			instance_deactivate_all(true);
			instance_activate_object(oPauseMenu);
			instance_activate_object(oCamera);
			instance_activate_object(oButton);
			instance_activate_object(oStats);
			button_reset_positions();
			
			// show mouse and center its position
			window_mouse_set(window_get_width() / 2, window_get_height() / 4);
			if (!global.using_controller) window_set_cursor(cr_default);
		}
		else
		{
			// unpausing
			state = prev_state;
			
			physics_pause_enable(false);
			instance_activate_all();
			instance_deactivate_object(oPauseMenu);
			instance_deactivate_object(oButton);
			window_set_cursor(cr_none);
		}
	}
	
	instance_activate_object(oGame);
	instance_activate_object(oTransition);
	if (debug_mode) instance_activate_object(oDebug);
}

// prepares to reset room
function level_out_of_time()
{
	with (oLevelManager)
	{
		state = LEVEL.TIME_OUT;
		alarm[0] = room_speed * 1;
	}
}

function level_start_countdown()
{
	with (oLevelManager)
	{
		state = LEVEL.COUNTING_DOWN;
		timer_create(3, level_begin);
	}
}

// creates timer remove invisible thing
function level_begin()
{
	with (oLevelManager)
	{
		state = LEVEL.PLAYING;
		ui_alpha = ui_alpha_start;
		timer_create(time_limit, level_out_of_time);
	}
	
	instance_destroy(oInvisibleSushiHolder);
}


function level_is_state(_level_state)
{
	with (oLevelManager)
		return state == _level_state;
}