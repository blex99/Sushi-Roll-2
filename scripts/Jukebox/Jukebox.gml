function jukebox_play_area_theme(_area_index)
{
	with (oJukebox)
	{
		var _song = level_themes[_area_index];
		if (!audio_is_playing(_song))
		{
			song_playing = _song;
			audio_play_sound(_song, 0, true);
			audio_sound_gain(_song, 1, 1000);
		}
	}
}