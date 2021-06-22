/// @description store songs

audio_group_load(agMusic);
audio_group_load(agSfx);

music_playing = noone;
music_stopping = noone;
music = [muMenu, muKitchen, muBamboo, muNeon, muSkyTemple];
sfx = [sfxAir, sfxBack, sfxHover, sfxKnife, sfxRoll, sfxSelect,
	sfxSelectLevel];

music_volume = 0.6; // TODO save/load volume settings
sfx_volume = 0.6;

control = false; /*	true = allowed to change volume
					false = NOT allowed, bc transitioning btw songs */
sfx_loaded = false;
music_loaded = false;