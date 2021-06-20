/// @description 

// you're crossfading to a new song, and the previous song has a volume of 0
if (!control && music_stopping != noone && 
	audio_sound_get_gain(music_stopping) == 0) 
{
	audio_stop_sound(music_stopping);
	audio_group_set_gain(agMusic, music_volume, 0);
	control = true;
}

/*
// DEBUG
var _len = array_length(music);
for (var i = 0; i < _len; i++)
{
	var _gain = audio_sound_get_gain(music[i]);
	add_to_debug_map(audio_get_name(music[i]) + ": " + string(_gain));
}

var _len = array_length(sfx);
for (var i = 0; i < _len; i++)
{
	var _gain = audio_sound_get_gain(sfx[i]);
	add_to_debug_map(audio_get_name(sfx[i]) + ": " + string(_gain));
}
*/