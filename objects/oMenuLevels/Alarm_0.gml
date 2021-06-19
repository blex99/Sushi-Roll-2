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
	jukebox_play_sfx(sfx_select_level);
	game_goto_level(area, menu_committed.btag);
}

menu_committed = noone;
menu_control = true;