/// @description new input detection

#region input detection
global.device_index = input_seek_gamepad();

var _keyboard_mouse_used = keyboard_check_pressed(vk_anykey) ||
	mouse_check_button_released(mb_any);

// not sure if there is another way to do this...
var _controller_used = 
	gamepad_button_check_pressed(global.device_index, gp_face1) ||
	gamepad_button_check_pressed(global.device_index, gp_face2) ||
	gamepad_button_check_pressed(global.device_index, gp_face3) ||
	gamepad_button_check_pressed(global.device_index, gp_face4) ||
	gamepad_button_check_pressed(global.device_index, gp_start) ||
	gamepad_button_check_pressed(global.device_index, gp_select) ||
	gamepad_button_check_pressed(global.device_index, gp_shoulderr) ||
	gamepad_button_check_pressed(global.device_index, gp_shoulderrb) ||
	gamepad_button_check_pressed(global.device_index, gp_shoulderl) ||
	gamepad_button_check_pressed(global.device_index, gp_shoulderlb);
	
if (global.using_controller && _keyboard_mouse_used)
{
	global.using_controller = false;
	update_cursor();
	info_box_create("Keyboard Detected");
}
else if (!global.using_controller && _controller_used)
{
	global.using_controller = true;
	update_cursor();
	info_box_create("Controller Detected");
}

#endregion

// restart room
if (instance_exists(oLevelManager) && keyboard_check_pressed(ord("R")))
{
	game_level_room_reset();
}
	
// manual full screen switching
if (keyboard_check(vk_alt) && keyboard_check_pressed(vk_enter))
	toggle_fullscreen();