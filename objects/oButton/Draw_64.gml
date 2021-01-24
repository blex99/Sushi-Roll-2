/// @description draw button

ui_nine_slice_box(sNineSliceBoxButton, x1, y1, x2, y2, sub_image);

draw_set_font(button_font);
draw_set_color(c_black);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(xcenter, ycenter, text);