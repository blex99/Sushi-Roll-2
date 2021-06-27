/// @description update level_index

var _areas = LEVEL_AREA.COUNT;
for (var i = 0; i < _areas; i++)
{
	var _len = array_length(levels[i]);
	for (var j = 0; j < _len; j++)
	{
		if (levels[i][j].room_name == room)
		{
			// you've entered a level room
			area_index = i;
			level_index = j;
			exit;
		}
	}
}

// if you've made it here, you should NOT in a level room
area_index = -1;
level_index = -1;
input_update_cursor();