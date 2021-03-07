/// @description do button's script, reset vars

with (menu_committed)
{
	if (my_script != noone)
	{
		script_execute_args(my_script, my_script_args);
	}
}

menu_committed = noone;
menu_control = true;