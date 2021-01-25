function level_completed(){
	with (oLevelManager)
	{
		state = LEVEL.COMPLETE;
		physics_pause_enable(true);
		timer_freeze();
		stats_calc_final_score();
		instance_create_depth(0, 0, -9999, oVictoryScreen);
	}
}

function is_level_complete()
{
	with (oLevelManager)
	{
		return state == LEVEL.COMPLETE;
	}
}

function level_toggle_pause()
{	
	with (oLevelManager)
	{
		paused = !paused;
		physics_pause_enable(paused);
		
		if (paused)
		{
			// pausing
			instance_deactivate_all(true);
			instance_activate_object(oPauseMenu);
			instance_activate_object(oButton);
			button_reset_positions();
			
			// show mouse and center its position, if you're not using a controller
			if (!input_controller_active())
			{
				window_mouse_set(window_get_width() / 2, window_get_height() / 2);
			}
			window_set_cursor(cr_default);
		}
		else
		{
			// unpausing
			instance_activate_all();
			instance_deactivate_object(oPauseMenu);
			instance_deactivate_object(oButton);
			window_set_cursor(cr_none);
		}
	}
	
	instance_activate_object(oGame);
	instance_activate_object(oTransition);
	
	if (!instance_exists(oDebug))
		instance_create_layer(0, 0, "Instances", oDebug);
	else instance_activate_object(oDebug);
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