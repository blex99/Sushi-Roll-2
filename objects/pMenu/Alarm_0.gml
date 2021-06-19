/// @description do button's script, reset vars

with (menu_committed)
{
	if (my_script != noone)
	{
		script_execute_args(my_script, my_script_args);
	}
}

if (menu_committed.object_index != oButtonBack)
{
	jukebox_play_sfx(sfx_select);
}

menu_committed = noone;
menu_control = true;