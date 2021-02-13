/// @description call level_completed

if (!level_is_state(LEVEL.COMPLETE) &&
	place_meeting(x, y, sushi_cur()))
{
	level_completed();
}