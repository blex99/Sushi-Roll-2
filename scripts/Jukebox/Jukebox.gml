function jukebox_play_song(_song_id)
{
	// don't play the music if im debugging and i say so ):<
	if (!global.debug.play_music) return;

	with (oJukebox)
	{
		// if music isn't loaded yet OR
		// you're already playing the song, return
		if (!music_loaded || music_playing == _song_id) return;
		
		// if you're stopping a song you're about to play,
		// stop it immediately
		if (music_stopping == _song_id) jukebox_stop_song();
		
		control = false;
		var _song_inst = audio_play_sound(_song_id, 0, true);
		audio_sound_gain(_song_inst, 0, 0);
		audio_sound_gain(_song_inst, music_volume, 1000);
		
		// play the song at one second before the end
		var _len = audio_sound_length(_song_id);
		audio_sound_set_track_position(_song_inst, _len - 0.5);
		
		// if you're playing a song, stop it
		if (music_playing != noone)
		{
			audio_sound_gain(music_playing, 0, 1000);
			music_stopping = music_playing;
		}
		//else music_stopping = noone;
		
		music_playing = _song_id;
	}
}

// stop the sound "music_stopping" is set to
// reset other vars
function jukebox_stop_song()
{
	with (oJukebox)
	{
		audio_stop_sound(music_stopping);
		audio_group_set_gain(agMusic, music_volume, 0);
		control = true;
		music_stopping = noone;
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
			case LEVEL_AREA.PAINT:
				jukebox_play_song(muPaint);
				break;
			case LEVEL_AREA.SKY_TEMPLE:
				jukebox_play_song(muSkyTemple);
				break;
			default:
				break;
		}
	}
}

// _volume_mult = volume multiplier
function jukebox_play_sfx(_sfx_id, _loop, _volume_mult, _pitch)
{
	if (0) return argument[0];
	if (_loop == undefined) _loop = false;
	if (_volume_mult == undefined) _volume_mult = 1;
	if (_pitch == undefined) _pitch = 1;
	
	var _inst = noone;
	
	with (oJukebox)
	{
		if (sfx_loaded)
		{
			_inst = audio_play_sound(_sfx_id, 0, _loop);
			audio_sound_gain(_sfx_id, clamp(sfx_volume * _volume_mult, 0, 1), 100);
			audio_sound_pitch(_sfx_id, _pitch);
		}
	}
	
	return _inst;
}

function jukebox_set_sfx_volume_mult(_sfx_id, _volume_mult, _time)
{
	with (oJukebox)
	{
		audio_sound_gain(_sfx_id, clamp(sfx_volume * _volume_mult, 0, 1), _time);
	}
}

function jukebox_get_sfx_volume() { with (oJukebox) return sfx_volume; }
function jukebox_set_sfx_volume(_value)
{
	with (oJukebox)
	{
		audio_group_set_gain(agSfx, _value, 100);
		sfx_volume = _value;
		data_set_volumes(music_volume, sfx_volume);
	}
}
function jukebox_increment_sfx_volume()
{
	with (oJukebox)
	{
		sfx_volume += 0.2;
		if (sfx_volume > 1) sfx_volume = 0;
		audio_group_set_gain(agSfx, sfx_volume, 100);
		info_box_create("SFX Volume " + string(round(sfx_volume * 100)) + "%",
			"SFX Volume");
		data_set_volumes(music_volume, sfx_volume);
	}
}

function jukebox_get_music_volume() { with (oJukebox) return music_volume; }
function jukebox_set_music_volume(_value)
{
	with (oJukebox)
	{
		audio_group_set_gain(agMusic, _value, 100);
		music_volume = _value;
		data_set_volumes(music_volume, sfx_volume);
	}
}
function jukebox_increment_music_volume()
{
	with (oJukebox)
	{
		music_volume += 0.2;
		if (music_volume > 1) music_volume = 0;
		audio_group_set_gain(agMusic, music_volume, 100);
		info_box_create("Music Volume " + string(round(music_volume * 100)) + "%",
			"Music Volume");
		data_set_volumes(music_volume, sfx_volume);
	}
}