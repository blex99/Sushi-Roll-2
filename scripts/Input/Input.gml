function input_one_pressed()
{
	if (global.using_controller)
	{
		return gamepad_button_check_pressed(global.device_index, gp_face1);
	}
	
	return mouse_check_button_pressed(mb_left) ||
		   keyboard_check_pressed(vk_enter) ||
		   keyboard_check_pressed(ord("X"));
}

function input_one()
{
	if (global.using_controller)
	{
		return gamepad_button_check(global.device_index, gp_face1);
	}
	
	return mouse_check_button(mb_left) ||
		   keyboard_check(vk_enter) ||
		   keyboard_check(ord("X"));
}

function input_up()
{
	if (global.using_controller)
	{
		return gamepad_axis_value(global.device_index, gp_axislv) < -0.8 ||
			   gamepad_button_check(global.device_index, gp_padu);
	}

	return keyboard_check(vk_up) ||
		   keyboard_check(ord("W"));
}

function input_down()
{
	if (global.using_controller)
		return gamepad_axis_value(global.device_index, gp_axislv) > 0.8 ||
			   gamepad_button_check(global.device_index, gp_padd);
	
	return keyboard_check(vk_down) ||
		   keyboard_check(ord("S"));
}

function input_left()
{
	if (global.using_controller)
		return gamepad_axis_value(global.device_index, gp_axislh) < -0.8 ||
			   gamepad_button_check(global.device_index, gp_padl);
	
	return keyboard_check(vk_left) ||
		   keyboard_check(ord("A"));
}

function input_right()
{
	if (global.using_controller)
		return gamepad_axis_value(global.device_index, gp_axislh) > 0.8 ||
			   gamepad_button_check(global.device_index, gp_padr);
	
	return keyboard_check(vk_right) ||
		   keyboard_check(ord("D"));
}

// for going back in menu
function input_back_pressed()
{
	if (global.using_controller)
	{
		return gamepad_button_check_pressed(global.device_index, gp_face2);
	}
	
	return keyboard_check_pressed(vk_escape) ||
		mouse_check_button_pressed(mb_right);
}

// for pausing
function input_pause_pressed()
{
	if (global.using_controller)
	{
		return gamepad_button_check_pressed(global.device_index, gp_start);
	}
	
	return keyboard_check_pressed(vk_escape);
}

function input_move_sushi()
{
	if (global.using_controller)
	{
		return gamepad_axis_value(global.device_index, gp_axislh);
	}
	else
	{
		return input_right() - input_left();
	}
} 

// return "normalized" x axis between -1 and 1
function input_rotate(){
	if (global.using_controller)
	{
		return gamepad_axis_value(global.device_index, gp_axisrh);
	}
	else
	{
		with (oInput)
		{
			var _normalized_input = 0;
			var _ranged_input = 0;

			_ranged_input = clamp(window_mouse_get_x(), w_min, w_max);
			_normalized_input = 2 * (_ranged_input - w_min) / (w_max - w_min);
			_normalized_input -= 1;
	
			return _normalized_input;
		}
	}
}

// clamp the mousey to be fixed in the y-direction
// clamp the mousex between a certain width based on the window
function input_clamp_mouse()
{
	with (oInput)
	{
		// clamp mouse to w_min and w_max
		var _mouse_x = clamp(window_mouse_get_x(), w_min, w_max);
		var _mouse_y = h_half;
		window_mouse_set(_mouse_x, _mouse_y);
	}
}

function input_update_window_stats()
{
	if (!instance_exists(oInput)) return;
	
	with (oInput)
	{
		// stats for the WINDOW
		w_half = window_get_width() * 0.5;
		h_half = window_get_height() * 0.5;
		max_range = w_half * width_range_ratio;
		w_min = w_half - max_range;
		w_max = w_half + max_range;
	}
}

// finds and returns gamepad index from 0->11 potential slots
function input_seek_gamepad()
{
	for (var _i = 0; _i <= 11; _i++)
	{
		if (gamepad_is_connected(_i)) return _i;
	}
	
	return -1;
}