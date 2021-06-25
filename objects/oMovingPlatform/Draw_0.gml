if (global.debug.show_debug) draw_path(path, xstart, ystart, false);

// draw dotted path
var _len = ds_list_size(path_dots);
for (var i = 0; i < _len; i++)
{
	with (path_dots[|i])
	{
		var _alpha = life_timer / life_timer_start;
		set_draw(c_black, _alpha);
		draw_circle(x, y, 3, false);
	}
}
reset_alpha();

draw_self();