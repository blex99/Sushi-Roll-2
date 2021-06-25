/// @description displays lvl name & other info

if (level_is_state(LEVEL.PAUSED)) exit;

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

draw_text_with_outline(GUI_W / 2, GUI_H / 4, _msg);

// draw speed of sushi
if (level_is_state(LEVEL.PLAYING))
{
	var _speed = sushi_get_speed();
	set_draw(c_black, 1, fnUIBig, fa_bottom, fa_right);
	draw_text_with_outline(GUI_W, GUI_H, "Speed: " + string(_speed) + " mph");
}

reset_alpha();