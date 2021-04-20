/// @description Insert description here

if (level_is_state(LEVEL.PLAYING))
{
	var _alpha = 1;
	if (alarm[0] != -1) _alpha = (alarm[0] + 0.5) / room_speed * 5;
	set_draw(c_black, _alpha, fnUI, fa_bottom, fa_center);
	draw_text_with_outline(x, y - sushi_ref.sprite_height / 2, text[text_i]);
}
