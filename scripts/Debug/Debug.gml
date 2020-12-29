function print(_msg)
{
	show_debug_message(_msg);
}

// returns the index in which the message is alloted to
function add_to_debug_map(_key, _val)
{
	with (oDebug)
	{
		ds_map_add(debug_messages, _key, _val);
	}
}
