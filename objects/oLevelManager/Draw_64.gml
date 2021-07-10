/// @description displays lvl name & other info

if (level_is_state(LEVEL.PAUSED)) exit;

var _msg = "";
set_draw(c_black, 1, fnUIBig, fa_center, fa_center);

if (level_is_state(LEVEL.PANNING))
{
	_msg = "~ Area " + string(area_index + 1) + " ~\n";
	_msg += "~ Level " + string(level_index + 1) + ": ";
	_msg += level.level_name + " ~";

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

reset_alpha();