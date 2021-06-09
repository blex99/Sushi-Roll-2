/// @description play

// determine type of room and play song accordingly
var _rname = room_get_name(room);
var _is_in_menu = string_pos("Menu", _rname) != 0;
var _is_in_level = string_pos("Level", _rname) != 0;

if (!_is_in_level)
{
	if (song_playing == song_147 ||
		song_playing == song_151 ||
		song_playing == song_160 ||
		song_playing == song_161 )
	{
		if (audio_is_playing(song_playing))
		{
			audio_sound_gain(song_playing, 0, 1000);
			song_stopping = song_playing;
			alarm[0] = room_speed / 10;
		}
	}
}

if (!_is_in_menu && audio_is_playing(song_138))
{
	audio_sound_gain(song_138, 0, 1000);
	alarm[0] = room_speed / 10;
	song_stopping = song_138;
}

if (_is_in_menu && !audio_is_playing(song_138))
{
	audio_play_sound(song_138, 0, true);
	audio_sound_gain(song_138, 1, 100);
	song_playing = song_138;
}