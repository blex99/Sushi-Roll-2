/// @description new input detection

if (level_is_state(LEVEL.PLAYING) && !using_controller)
{
	input_clamp_mouse();
}

#region input detection
device_index = input_seek_gamepad();

var _keyboard_mouse_used = keyboard_check_pressed(vk_anykey) ||
	mouse_check_button_released(mb_any);

// not sure if there is another way to do this...
var _controller_used = 
	gamepad_button_check_pressed(device_index, gp_face1) ||
	gamepad_button_check_pressed(device_index, gp_face2) ||
	gamepad_button_check_pressed(device_index, gp_face3) ||
	gamepad_button_check_pressed(device_index, gp_face4) ||
	gamepad_button_check_pressed(device_index, gp_start) ||
	gamepad_button_check_pressed(device_index, gp_select) ||
	gamepad_button_check_pressed(device_index, gp_shoulderr) ||
	gamepad_button_check_pressed(device_index, gp_shoulderrb) ||
	gamepad_button_check_pressed(device_index, gp_shoulderl) ||
	gamepad_button_check_pressed(device_index, gp_shoulderlb) ||
	gamepad_axis_value(device_index, gp_axislh) > 0.8 || // right
	gamepad_axis_value(device_index, gp_axislh) < -0.8 || // left
	gamepad_axis_value(device_index, gp_axislv) > 0.8 || // down
	gamepad_axis_value(device_index, gp_axislv) < -0.8; // up
	
if (using_controller && _keyboard_mouse_used)
{
	using_controller = false;
	input_update_cursor();
	info_box_create("Keyboard Detected");
}
else if (!using_controller && _controller_used)
{
	using_controller = true;
	input_update_cursor();
	info_box_create("Controller Detected");
}

#endregion