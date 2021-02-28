/// @description update level_index

var _difficulties = LEVEL_DIFF.COUNT;
for (var i = 0; i < _difficulties; i++)
{
	var _len = array_length(levels[i]);
	for (var j = 0; j < _len; j++)
	{
		if (levels[i][j].room_name == room)
		{
			// you've entered a level room
			diff_index = i;
			level_index = j;
			exit;
		}
	}

}

// if you've made it here, you should NOT in a level room
update_cursor();
