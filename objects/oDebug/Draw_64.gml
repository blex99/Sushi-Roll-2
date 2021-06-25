/// @desc debug messages

if (global.debug.show_debug)
{
	set_draw(c_black, 1, fnDebug, fa_top, fa_right);
	draw_text_with_outline(GUI_W, 0, "~~ DEBUG ~~");

	var _array = ds_map_values_to_array(debug_messages);

	for (var _i = 0; _i < array_length(_array); ++_i)
	{
		var _message = _array[_i];
		set_draw(c_black, 1);
		draw_text_with_outline(GUI_W, (_i + 1) * 16, _message);
	}

	reset_alpha();
}