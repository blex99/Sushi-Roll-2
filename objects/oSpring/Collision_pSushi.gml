/// @desc make sushi spring

if (alarm[0] == -1)
{
	sushi_jump(130);
	alarm[0] = room_speed / 2;
	image_xscale = 1.1;
	xscale_target = 0.6;
}