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
	game_goto_level(difficulty, menu_committed.btag);
}

menu_committed = noone;
menu_control = true;