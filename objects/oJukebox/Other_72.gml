/// @description sounds loaded

if (!music_loaded && audio_group_is_loaded(agMusic))
{
	music_loaded = true;
	audio_group_set_gain(agMusic, music_volume, 0);
	jukebox_play_song(muMenu);
	control = true;
}

if (!sfx_loaded && audio_group_is_loaded(agSfx))
{
	sfx_loaded = true;
	audio_group_set_gain(agSfx, sfx_volume, 0);
}