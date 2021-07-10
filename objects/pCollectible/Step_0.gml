/// @desc oscillate and detect sushi

y = oscillate(ystart, 2, 1);

if (place_meeting(x, y, sushi_cur()))
{
	jukebox_play_sfx(sfx_collectible, false, sfx_vol_mult, 1);
	script_execute(collect_event);
	instance_destroy();
}