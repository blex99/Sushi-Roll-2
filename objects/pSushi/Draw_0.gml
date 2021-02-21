/// @description draw 


if (can_display_debug()) 
{
	physics_draw_debug();
	var _alpha = 1;
	var _color = c_green;
	
	var _left = keyboard_check(ord("A"));
	var _right = keyboard_check(ord("D"));
	_x_dir = _right - _left;
	
	draw_sprite_ext(sArrow, 0, x, y, _x_dir * 2, 1, 0, _color, _alpha);
}

draw_self();
//draw_sprite_ext(sprite, 0, round(phy_position_x), round(phy_position_y),
//	image_xscale, image_yscale, round(-phy_rotation) , image_blend, image_alpha);