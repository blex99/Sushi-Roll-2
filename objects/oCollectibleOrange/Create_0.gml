/// @description gray-out if collected

event_inherited();

if (level_is_orange_collected())
{
	image_index = 1;
	image_alpha = 0.5;
}

collect_event = level_set_orange_collected;