/// @desc debug messages

if (can_display_debug())
{
	var _w = display_get_gui_width();
	
	set_draw(c_black, 1, fnDebug, fa_top, fa_right);
	draw_text(_w + 2, 0, "~~ DEBUG ~~");
	
	set_draw(c_silver, 1);
	draw_text(_w, 0, "~~ DEBUG ~~");

	var _array = ds_map_values_to_array(debug_messages);

	for (var _i = 0; _i < array_length(_array); ++_i)
	{
		var _message = _array[_i];
		set_draw(c_black, 1);
		draw_text(_w + 2, (_i + 1) * 16, _message);
		
		set_draw(c_silver, 1);
		draw_text(_w, (_i + 1) * 16, _message);
	}

	reset_alpha();
}