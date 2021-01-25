/// @description update level index

if (level_index != -1 && levels[level_index] == room)
{
	// player must have died or reset the room
	level_first_try = false;
	exit;
}

for (var i = 0; i < array_length(levels); i++)
{
	if (levels[i] == room)
	{
		level_index = i;
		level_first_try = true;
		break;
	}
}