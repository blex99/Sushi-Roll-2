// debug functions

// short-hand print
function print(_msg)
{
	show_debug_message(_msg);
}

function can_display_debug()
{
	with (oDebug)
	{
		return debug_mode && show_debug;	
	}
	
	return false;
}

// put in string in this format: "key: + string(value)"
function add_to_debug_map(_str)
{
	if (debug_mode)
	{
		with (oDebug)
		{
			var _i = string_pos(":", _str);
			var _key = string_copy(_str, 0, _i);
		
			if (_i == 0)
			{
				debug_messages[? "!"] = "INVALID FORMAT: " + _str;
				return;
			}

			debug_messages[? _key] = _str;
		}
	}
}
