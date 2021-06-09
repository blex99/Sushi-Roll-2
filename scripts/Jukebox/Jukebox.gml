function jukebox_play_area_theme(_area_index)
{
	with (oJukebox)
	{
		var _song;
		switch (_area_index)
		{
			case 0: 
				_song = song_147;
				break;
			case 1: 
				_song = song_151;
				break;
			case 2: 
				_song = song_160;
				break;
			case 3: 
				_song = song_161;
				break;
		}
		
		if (!audio_is_playing(_song))
		{
			song_playing = _song;
			audio_play_sound(_song, 0, true);
			audio_sound_gain(_song, 1, 1000);
		}
	}
}