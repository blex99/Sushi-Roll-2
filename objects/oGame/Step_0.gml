/// @description new input detection

global.device_index = input_seek_gamepad();

if (gamepad_is_connected(global.device_index) != global.using_controller)
{
	global.using_controller = gamepad_is_connected(global.device_index);
	update_cursor();
	var _msg = (global.using_controller) ? "Controller Detected" : "Using Keyboard";
	info_box_create(_msg);
}

