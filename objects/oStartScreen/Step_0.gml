if (global.using_controller)
{
	if (gamepad_button_check_pressed(global.device_index, gp_face1))
	{
		transition_start(rMainMenu);	
	}
}
else
{
	if (keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any))
	{
		transition_start(rMainMenu);
	}
}