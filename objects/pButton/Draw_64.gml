/// @description drawing the button

draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);

set_draw(c_black, image_alpha, button_font, fa_center, fa_center);
var _final_text = text;
if (button_state == BUTTON.HOVERING && text != "")
{
	if (hovering_target_scale < image_xscale)
	{
		_final_text = "-  " + text + "  -";
	}
	else
	{
		_final_text = "- " + text + " -";
	}
}
draw_text(xcenter, ycenter, _final_text);