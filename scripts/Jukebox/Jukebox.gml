function jukebox_play_song(_song_id)
{
	with (oJukebox)
	{
		// if music isn't loaded yet OR
		// you're already playing the song, return
		if (!music_loaded || music_playing == _song_id) return;
		
		control = false;
		audio_play_sound(_song_id, 0, true);
		audio_sound_gain(_song_id, 0, 0);
		audio_sound_gain(_song_id, music_volume, 1000);
		
		// if you're playing a song, stop it
		if (music_playing != noone)
		{
			audio_sound_gain(music_playing, 0, 1000);
			music_stopping = music_playing;
		}
		else music_stopping = noone;
		
		music_playing = _song_id;
	}
}

function jukebox_play_song_by_area(_area_index)
{
	with (oJukebox)
	{
		switch (_area_index)
		{
			case LEVEL_AREA.KITCHEN:
				jukebox_play_song(muKitchen);
				break;
			case LEVEL_AREA.BAMBOO:
				jukebox_play_song(muBamboo);
				break;
			case LEVEL_AREA.SKY_TEMPLE:
				jukebox_play_song(muSkyTemple);
				break;
			case LEVEL_AREA.NEON:
				jukebox_play_song(muNeon);
				break;
			default:
				break;
		}
	}
}

function jukebox_play_sfx(_sfx_id, _loop)
{
	if (0) return argument[0];
	if (_loop == undefined) _loop = false;
	
	with (oJukebox)
	{
		if (sfx_loaded)
		{
			audio_play_sound(_sfx_id, 0, _loop);
			audio_sound_gain(_sfx_id, sfx_volume, 100);
		}
	}
}

function jukebox_play_random_sfx()
{
	with (oJukebox)
	{
		var _len = array_length(sfx);
		jukebox_play_sfx(sfx[irandom(_len - 1)]);
	}
}

function jukebox_get_sfx_volume() { with (oJukebox) return sfx_volume; }
function jukebox_set_sfx_volume(_value)
{
	with (oJukebox)
	{
		audio_group_set_gain(agSfx, _value, 10);
		sfx_volume = _value;
	}
}

function jukebox_get_music_volume() { with (oJukebox) return music_volume; }
function jukebox_set_music_volume(_value)
{
	with (oJukebox)
	{
		audio_group_set_gain(agMusic, _value, 10);
		music_volume = _value;
	}
}
