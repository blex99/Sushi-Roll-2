/// @description drawing the button

draw_sprite_ext(sprite_index, sub_image, x, y, image_xscale, image_yscale, 0, c_white, 1);

set_draw(c_black, 1, button_font, fa_center, fa_center);
draw_text_with_outline(xcenter, ycenter, text);