/// @description trigger particle effects
	
var _x = irandom_range(bbox_left + 64, bbox_right - 128);
var _y = irandom_range(bbox_top, bbox_top - 32);
effect_create_below(ef_smoke, _x, _y, choose(0, 1), c_white);