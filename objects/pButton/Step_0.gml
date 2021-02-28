/// @description image scaling

var _target_scale = 1;
if (sub_image == BUTTON.HOVERING)
	_target_scale = 1.1;
	
image_xscale = lerp(image_yscale, _target_scale, 0.25);
image_yscale = lerp(image_yscale, _target_scale, 0.25);