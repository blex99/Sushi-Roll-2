/// @description draw info box

ui_nine_slice_box(info_box_sprite, x1, y1, x2, y2, 0, alpha);

draw_set_font(info_box_font);
draw_set_color(c_black);
draw_set_alpha(alpha);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text_with_outline(xcenter, ycenter, text);

reset_alpha();