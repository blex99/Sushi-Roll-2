/// @description full screen & etc commands

if (keyboard_check(vk_lcontrol) && keyboard_check_pressed(ord("F")))
{
	var _full = window_get_fullscreen();
	window_set_fullscreen(!_full);
}

if (keyboard_check(vk_escape)) game_end();

if (keyboard_check(ord("O"))) global.using_controller =! global.using_controller;