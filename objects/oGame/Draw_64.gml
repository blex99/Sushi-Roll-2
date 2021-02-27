/// @description show fps

set_draw(c_lime, 1, fnDebug, fa_bottom, fa_right);
draw_text_with_outline(display_get_gui_width(), display_get_gui_height(), "fps: " + string(fps));