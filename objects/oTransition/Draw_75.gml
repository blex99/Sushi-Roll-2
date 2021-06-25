/// @description draw black fade

if (mode == TRANS_MODE.OFF) exit;

set_draw(c_black, percent);
draw_rectangle(0, 0, GUI_W, GUI_H, false);
reset_alpha();