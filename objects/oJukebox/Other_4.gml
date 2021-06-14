/// @description play

// determine type of room and play song accordingly
var _rname = room_get_name(room);
var _is_in_menu = string_pos("Menu", _rname) != 0;

// check if a level theme is playing (and you're not at the corresponding area)
var _len = array_length(level_themes);
for (var i = 0; i < _len; i++)
{
	if (audio_is_playing(level_themes[i]) && oGame.area_index != i)
	{
		audio_sound_gain(level_themes[i], 0, 1000);
		song_stopping = level_themes[i];
		alarm[0] = room_speed / 10;
	}
}

if (!_is_in_menu && audio_is_playing(menu_theme))
{
	audio_sound_gain(menu_theme, 0, 1000);
	alarm[0] = room_speed / 10;
	song_stopping = menu_theme;
}

if (_is_in_menu && !audio_is_playing(menu_theme))
{
	audio_play_sound(menu_theme, 0, true);
	audio_sound_gain(menu_theme, 1, 100);
	song_playing = menu_theme;
}

if (DEBUG_NO_MUSIC && debug_mode)
{
	audio_stop_all();
}
