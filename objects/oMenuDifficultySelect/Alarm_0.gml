/// @description do button's script, reset vars

with (buttons[menu_committed])
{
	if (my_script != noone)
		script_execute_args(my_script, my_script_args);
}

menu_committed = -1;
menu_control = true;