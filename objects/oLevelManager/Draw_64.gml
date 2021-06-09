/// @description displays lvl name & other info

if (level_is_state(LEVEL.PAUSED)) exit;

var _w = display_get_gui_width();
var _h = display_get_gui_height();
var _msg = "";
set_draw(c_black, 1, fnUIBig, fa_center, fa_center);

if (level_is_state(LEVEL.PANNING))
{
	_msg = "~ Area " + string(area_number) + " ~\n";
	_msg += "~ Level " + string(level_number) + ": ";
	_msg += level_struct.level_name + " ~";

	draw_set_alpha(ui_alpha);
}
else if (level_is_state(LEVEL.COUNTING_DOWN))
{
	_msg = "Ready?";
}
else if (level_is_state(LEVEL.PLAYING))
{
	_msg = "Go!";
	draw_set_alpha(ui_alpha);
}

draw_text_with_outline(_w / 2, _h / 4, _msg);

// draw speed of sushi
var _speed = sushi_get_speed();
set_draw(c_black, 1, fnUIBig, fa_bottom, fa_right);
draw_text_with_outline(_w, _h, "Speed: " + string(_speed) + " mph");

reset_alpha();