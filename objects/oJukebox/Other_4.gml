/// @description play menu theme

// determine type of room and play song accordingly
var _rname = room_get_name(room);
var _is_in_menu = string_pos("Menu", _rname) != 0;

if (_is_in_menu)
{
	jukebox_play_song(muMenu);
}

// stop the music if im debugging and i say so ):<
if (!DEBUG_PLAY_MUSIC && debug_mode)
{
	audio_stop_all();
}