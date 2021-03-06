// select.. notice NOT pressed
function input_one()
{
	var _input = mouse_check_button(mb_left) ||
		gamepad_button_check(global.device_index, gp_face1);
	return _input;
}

function input_one_pressed()
{
	var _input = mouse_check_button_pressed(mb_left) ||
		gamepad_button_check_pressed(global.device_index, gp_face1);
	return _input;
}

function input_up()
{
	if (global.using_controller)
	{
		return gamepad_axis_value(global.device_index, gp_axislv) < -0.8 ||
			   gamepad_button_check(global.device_index, gp_padu);
	}

	return keyboard_check(vk_up);
}

function input_down()
{
	if (global.using_controller)
		return gamepad_axis_value(global.device_index, gp_axislv) > 0.8 ||
			   gamepad_button_check(global.device_index, gp_padd);
	
	return keyboard_check(vk_down);
}

function input_left()
{
	if (global.using_controller)
		return gamepad_axis_value(global.device_index, gp_axislh) < -0.8 ||
			   gamepad_button_check(global.device_index, gp_padl);
	
	return keyboard_check(vk_left);
}

function input_right()
{
	if (global.using_controller)
		return gamepad_axis_value(global.device_index, gp_axislh) > 0.8 ||
			   gamepad_button_check(global.device_index, gp_padr);
	
	return keyboard_check(vk_right);
}

// for pausing
function input_start_pressed()
{
	var _input = keyboard_check_pressed(vk_escape) ||
		gamepad_button_check_pressed(global.device_index, gp_start);
	return _input;
}

// return "normalized" x axis between -1 and 1
function input_x_axis(){
	if (global.using_controller)
	{
		return gamepad_axis_value(global.device_index, gp_axisrh);
	}
	else
	{
		var _normalized_input = 0;
		var _ranged_input = 0;
	
		with (pRotateable)
		{
			_ranged_input = input_x_mouse_clamp(w_min, w_max);
			_normalized_input = 2 * (_ranged_input - w_min) / (w_max - w_min);
			_normalized_input -= 1;
		}
	
		return _normalized_input;
	}
}

function input_x_mouse_clamp(_min, _max)
{
	with (pRotateable)
	{
		return clamp(window_mouse_get_x(), _min, _max);	
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
