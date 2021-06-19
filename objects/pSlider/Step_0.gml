/// @description check for selected

if (mouse_check_button(mb_left))
{
	var _bx = x + sprite_width * value;
	var _by = y;
	var _bwh = sprite_get_width(sUISliderButton) / 2;
	var _bhh = sprite_get_height(sUISliderButton) / 2;
	
	if (point_in_rectangle(MOUSE_GUI_X, MOUSE_GUI_Y,
		_bx - _bwh, _by - _bhh,
		_bx + _bwh, _by + _bhh))
	{
		selected = true;
	}
}

if (!mouse_check_button(mb_left))
{
	selected = false;
}

if (selected)
{
	value = clamp((MOUSE_GUI_X - x) / sprite_width, 0, max_value);
	event_user(0);
}