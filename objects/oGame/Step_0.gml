/// @description new input detection

global.device_index = input_seek_gamepad();

if (gamepad_is_connected(global.device_index) != global.using_controller)
{
	global.using_controller = gamepad_is_connected(global.device_index);
	update_cursor();
	var _msg = (global.using_controller) ? "Controller Detected" : "Using Keyboard";
	info_box_create(_msg);
}

// restart room
if (instance_exists(oLevelManager) && keyboard_check_pressed(ord("R")))
{
	game_level_room_reset();
}
	
// manual full screen switching
if (keyboard_check(vk_alt) && keyboard_check_pressed(vk_enter))
	toggle_fullscreen();