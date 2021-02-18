/// @description Insert description here
var _left = bbox_left;
var _top = bbox_top - transBufferHeight;
var _shader = shWave;

#region water
if (!surface_exists(waterSurface))
{
	waterSurface = surface_create(sprite_width, sprite_height + transBufferHeight);
	exit;
}

surface_set_target(waterSurface);
{
	draw_clear_alpha(c_blue, 0);

	// light blue body
	draw_set_alpha(0.95);
	draw_set_color($f4bb41);
	draw_rectangle(0, transBufferHeight, sprite_width, sprite_height + transBufferHeight, false);
	
	// darker blue line
	draw_set_color($f4eb42);
	draw_line(0, transBufferHeight + 1, sprite_width, transBufferHeight + 1);
	
	// white line on top
	draw_set_color(c_white);
	draw_line(0, transBufferHeight, sprite_width, transBufferHeight);
}
surface_reset_target();

pW = texture_get_texel_width(surface_get_texture(waterSurface));
pH = texture_get_texel_height(surface_get_texture(waterSurface));
#endregion
	
#region ripples
if (!surface_exists(springSurface))
{
	springSurface = surface_create(sprite_width, sprite_height + transBufferHeight);
	exit;
}

surface_set_target(springSurface);
{	
	// wave/wobble shader effect
	draw_clear_alpha(c_white, 0);
	shader_set(_shader);
	{
		shader_set_uniform_f(shader_get_uniform(_shader, "pixelH"), pH);
		shader_set_uniform_f(shader_get_uniform(_shader, "pixelW"), pW);
		shader_set_uniform_f(shader_get_uniform(_shader, "springCount"), springCount);
		shader_set_uniform_f_array(shader_get_uniform(_shader, "springs"), springs);
		shader_set_uniform_f(shader_get_uniform(_shader, "time"), get_timer() * 0.0000025);
		draw_surface(waterSurface, 0, 0);
	}
	shader_reset();
}
surface_reset_target();
#endregion

draw_surface(springSurface, _left, _top);
draw_set_alpha(1);