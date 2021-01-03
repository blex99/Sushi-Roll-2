/// @description fades sushi out

event_inherited();

if (alarm[0] != -1)
{
	sushi_cur().image_alpha = alarm[0] / time_to_restart;
}