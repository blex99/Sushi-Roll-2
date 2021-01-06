// jump
function input_one_pressed(){
	var _input = mouse_check_button_pressed(mb_right) || gamepad_button_check_pressed(DEVICE_NUM, gp_face1);
	return _input;
}

// select.. notice NOT pressed
function input_two(){
	var _input = mouse_check_button(mb_left) || gamepad_button_check(DEVICE_NUM, gp_face2);
	return _input;
}

function input_x_axis(){
	if (input_controller_active())
	{
		return gamepad_axis_value(DEVICE_NUM, gp_axislh);
	}
	
	var _normalized_input = 0;
	var _ranged_input = 0;
	
	with (oLevelController)
	{
		_ranged_input = input_x_mouse_clamp(w_min, w_max);
		_normalized_input = (2 * (_ranged_input - w_min) / (w_max - w_min)) - 1;
	}
	
	return _normalized_input;
}

function input_x_mouse_clamp(_min, _max)
{
	return clamp(window_mouse_get_x(), _min, _max);	
}

function input_controller_active()
{
	return global.using_controller && gamepad_is_connected(DEVICE_NUM);
}