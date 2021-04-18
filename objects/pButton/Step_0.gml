/// @description image scaling and alpha

// if you're hovering or clicked on, be full alpha of 1
image_alpha = (button_state == BUTTON.IDLE) ? 0.75 : 1;

var _target_scale = 1;
if (button_state == BUTTON.HOVERING)
	_target_scale = 1.1;
image_xscale = lerp(image_yscale, _target_scale, 0.25);
image_yscale = lerp(image_yscale, _target_scale, 0.25);