/// @description display press any key

var _w_half = display_get_gui_width()   * 0.50;
var _h = display_get_gui_height();

var _text = " ~ Press Any Key ~ ";
if (global.using_controller) _text = "~ Press A ~ ";

set_draw($70ff70, 1, fnUIBig, fa_center, fa_center);
draw_text(_w_half, _h * 0.9, _text);