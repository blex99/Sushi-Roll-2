/// @desc oscillate and detect sushi

y = oscillate(ystart, 2, 1);

if (place_meeting(x, y, sushi_cur()))
{
	script_execute(collect_event);
	instance_destroy();
}