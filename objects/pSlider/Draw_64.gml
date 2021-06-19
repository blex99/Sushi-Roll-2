/// @description draw GUI

draw_sprite(sprite_index, 0, x, y);

draw_sprite_part(sprite_index, 1, 0, 0, sprite_width * value,
	sprite_height, x, y - sprite_get_yoffset(sprite_index));
	
draw_sprite(sUISliderButton, 0, x + sprite_width * value, y);

// draw name of slider
set_draw(c_black, 1, fnUI, fa_top, fa_center);
draw_text(x + sprite_width / 2, y + sprite_height / 2 + 8, name);

draw_circle(MOUSE_GUI_X, MOUSE_GUI_Y, 3, false);

reset_alpha();
