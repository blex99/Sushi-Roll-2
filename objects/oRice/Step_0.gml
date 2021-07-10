if (level_is_state(LEVEL.PAUSED)) exit;

y = oscillate(ystart, 4, 0.5);
x = oscillate(xstart, 2, 2);

if (place_meeting(x, y, pSushi))
{
	//sushi_change_size(true);
	jukebox_play_sfx(sfx_rice_collect, false, sfx_vol_mult, 1);
	stats_increment_rice_counter();
	instance_destroy();
}