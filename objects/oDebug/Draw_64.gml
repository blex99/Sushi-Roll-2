var _w = display_get_gui_width();

set_draw(fa_top, fa_right, c_black, 1);
draw_text(_w, 0, "~~ DEBUG ~~");

var _array = ds_map_values_to_array(debug_messages);

for (var _i = 0; _i < array_length(_array); ++_i)
{
	var _message = _array[_i];
	draw_text(_w, (_i + 1) * 10, _message);
}

//ds_map_clear(debug_messages);