/// @description call level_completed

if (!is_level_complete() &&
	place_meeting(x, y, sushi_cur()))
{
	level_completed();
}