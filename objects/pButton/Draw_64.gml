/// @description drawing the button

draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);

set_draw(c_black, 1, button_font, fa_center, fa_center);
draw_text_with_outline(xcenter, ycenter, text);