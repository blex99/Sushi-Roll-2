/// @description do button's script, reset vars

if (buttons[menu_committed].object_index == oButtonBack)
{
	with (buttons[menu_committed])
	{
		script_execute_args(my_script, my_script_args);
	}
}
else
{
	game_goto_level(difficulty, menu_committed);
}

menu_committed = -1;
menu_control = true;