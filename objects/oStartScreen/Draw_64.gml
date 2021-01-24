/// @description display press any key

var _w_half = display_get_gui_width()   * 0.50;
var _h_threeq = display_get_gui_height() * 0.75;

var _text = " ~ Press Any Key ~ ";
if (input_controller_active()) _text = "~ Press A ~ ";

set_draw(c_black, 1, fnUIBig, fa_center, fa_center);
draw_text(_w_half, _h_threeq, _text);