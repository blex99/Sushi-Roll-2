/// @desc debug messages


if (global.debug.show_visuals)
{
	var _w = display_get_gui_width();
	var _h = display_get_gui_height();
	
	set_draw(c_black, 1, fnDebug, fa_top, fa_right);
	draw_text_with_outline(_w, 0, "~~ DEBUG ~~");

	var _array = ds_map_values_to_array(debug_messages);

	for (var _i = 0; _i < array_length(_array); ++_i)
	{
		var _message = _array[_i];
		set_draw(c_black, 1);
		draw_text_with_outline(_w, (_i + 1) * 16, _message);
	}
	
	//show fps
	//set_draw(c_lime, 1, fnDebug, fa_bottom, fa_right);
	//draw_text_with_outline(_w, _h, "fps: " + string(fps));

	reset_alpha();
}