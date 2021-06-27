/// @desc manual full screen switching

if (keyboard_check(vk_alt) && keyboard_check_pressed(vk_enter))
{
	// we don't want to accidentally select in a menu!
	keyboard_clear(vk_enter); 
	toggle_fullscreen();
}