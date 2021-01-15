/// @desc debug messages

if (can_display_debug())
{
	var _w = display_get_gui_width();

	set_draw(c_fuchsia, 0.7, fnDebug, fa_top, fa_right);
	draw_text(_w, 0, "~~ DEBUG ~~");

	var _array = ds_map_values_to_array(debug_messages);

	for (var _i = 0; _i < array_length(_array); ++_i)
	{
		var _message = _array[_i];
		draw_text(_w, (_i + 1) * 16, _message);
	}

	reset_alpha();
}