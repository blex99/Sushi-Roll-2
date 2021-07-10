/// @description store songs

audio_group_load(agMusic);
audio_group_load(agSfx);

music_playing = noone;
music_stopping = noone;

music_volume = data_get_start_music_volume();
sfx_volume = data_get_start_sfx_volume();

control = false; /*	true = allowed to change volume
					false = NOT allowed, bc transitioning btw songs */
sfx_loaded = false;
music_loaded = false;