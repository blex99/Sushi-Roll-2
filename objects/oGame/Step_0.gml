/// @description commands and new input detection

if (gamepad_is_connected(global.device_index) != global.using_controller)
{
	if (instance_exists(oInfoBox)) instance_destroy(oInfoBox);
	global.using_controller = gamepad_is_connected(global.device_index)
	var _msg = (global.using_controller) ? "Controller Detected" : "Using Keyboard";
	info_box_create(_msg);
}

var _mouse_wup = mouse_wheel_up();
var _mouse_wdown = mouse_wheel_down();

if (_mouse_wup || _mouse_wdown)
{
	var _max_scale = window_get_fullscreen() ? window_scale_max : window_scale;
	gui_scale += (_mouse_wdown - _mouse_wup) * 0.25;
	gui_scale = clamp(gui_scale, 1, _max_scale);
	display_set_gui_size(ideal_width * gui_scale, ideal_height * gui_scale);
}

if (keyboard_check_pressed(ord("Z")))
{
	game_set_window_scale(window_scale + 1);
}

if (keyboard_check_pressed(ord("X")))
{
	game_set_window_scale(window_scale - 1);
}

add_to_debug_map("level_index: " + string(level_index));
add_to_debug_map("level_first_try: " + ((level_first_try) ? "true" : "false"));