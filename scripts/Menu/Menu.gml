function menu_goto_previous_room()
{
	with (pMenu)
	{
		if (my_previous_room > 0)
		{
			transition_start(my_previous_room);
			audio_play_sound(sfx_back, 0, 0);
		}
	}
}