/// @description toggle full screen

if (keyboard_check(vk_lcontrol) && keyboard_check_pressed(ord("F")))
{
	var _full = window_get_fullscreen();
	window_set_fullscreen(!_full);
}