/// @description draw arrow & invinsibility

/*
if (can_display_debug()) 
{
	physics_draw_debug();
	var _alpha = 0.2 + (abs(force) / force_max);
	var _color = c_green;
	
	// turn red when close to the max force
	if (force_max - abs(force) < 0.2) _color = c_red;
	
	draw_sprite_ext(sArrow, 0, x, y, force, 1, 0, _color, _alpha);
}
*/

if (sushi_invincible()) image_alpha = 0.5;
else					image_alpha = 1;

draw_self();