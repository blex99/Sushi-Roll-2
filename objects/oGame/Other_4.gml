/// @description update level index

var _len = array_length(levels);

for (var i = 0; i < _len; i++)
{
	if (levels[i] == room)
	{
		// you've entered a level room
		level_index = i;
		exit;
	}
}

// if you've made it here, you should NOT in a level room
window_set_cursor(cr_default);