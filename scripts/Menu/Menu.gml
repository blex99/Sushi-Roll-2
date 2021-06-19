function menu_goto_previous_room()
{
	with (pMenu)
	{
		if (my_previous_room > 0)
		{
			transition_start(my_previous_room);
			jukebox_play_sfx(sfx_back);
		}
	}
}