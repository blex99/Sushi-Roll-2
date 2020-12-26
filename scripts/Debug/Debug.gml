function print(_msg)
{
	show_debug_message(_msg);
}

// returns the index in which the message is alloted to
function add_to_debug_messages(_msg)
{
	var _index = -1;
	with (oDebug)
	{
		ds_list_add(debug_messages, _msg);
		_index = ds_list_size(debug_messages) - 1;
	}
	return _index;
}
