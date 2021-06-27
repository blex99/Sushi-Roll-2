/// @description image scaling and alpha

// if you're hovering or clicked on, be full alpha of 1
image_alpha = (button_state == BUTTON.IDLE) ? 0.5 : 1;

var _final_scale = 1;
if (button_state == BUTTON.HOVERING)
{
	_final_scale = hovering_target_scale;

	// oscillate only xscale
	image_xscale = oscillate(_final_scale, 0.1, 1);
}
else
{
	// lerp back to original scale
	image_xscale = lerp(image_xscale, 1, 0.25);
}

image_yscale = lerp(image_yscale, _final_scale, 0.25);