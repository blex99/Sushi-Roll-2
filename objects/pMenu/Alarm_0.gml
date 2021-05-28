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
	audio_play_sound(sfx_select, 0, 0);
}

menu_committed = noone;
menu_control = true;