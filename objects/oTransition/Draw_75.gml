/// @description draw black fade

if (mode != TRANS_MODE.OFF)
{
	set_draw(c_black, percent);
	draw_rectangle(0, 0, w, h, false);
	reset_alpha();
}