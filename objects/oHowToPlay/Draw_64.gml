/// @description display how to play msg

set_draw(c_white, 1, font, fa_center, fa_center);

if (index == 1) set_draw(c_green);
if (index == 2) set_draw(c_red);

if (index < array_length(arr))
	draw_text_ext(w / 2, h / 2, arr[index], font_get_size(font) * 2, w / 2);