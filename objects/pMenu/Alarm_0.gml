/// @description do button's script, reset vars

with (menu_committed)
{
	script_execute_args(my_script, my_script_args);
}

menu_committed = noone;
menu_control = true;