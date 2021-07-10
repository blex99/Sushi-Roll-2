/// @description stop looping sound and remove list

ds_list_destroy(sushi_speeds);

if (audio_is_playing(sfx_air_inst))
	audio_stop_sound(sfx_air_inst);

if (audio_is_playing(sfx_bubbling_inst))
	audio_stop_sound(sfx_bubbling_inst);