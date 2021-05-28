/// @description do button's script, reset vars

if (menu_committed.object_index == oButtonBack)
{
	with (menu_committed)
	{
		script_execute_args(my_script, my_script_args);
	}
}
else
{
	audio_play_sound(sfx_select_level, 0, 0);
	game_goto_level(area, menu_committed.btag);
}

menu_committed = noone;
menu_control = true;