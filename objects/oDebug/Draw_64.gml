draw_set_alpha(1);
draw_set_color(c_black);
draw_text(0, 0, "~~ DEBUG ~~");

var _array = ds_map_values_to_array(debug_messages);

for (var _i = 0; _i < array_length(_array); ++_i)
{
	var _message = _array[_i];
	draw_text(0, (_i + 1) * 10, _message);
}

ds_map_clear(debug_messages);