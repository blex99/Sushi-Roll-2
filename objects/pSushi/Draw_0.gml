/// @description draw 

if (global.debug.show_visuals) 
{
	physics_draw_debug();
}

var _speed = sushi_get_speed();
var _rot = round_to_nearest(-phy_rotation, 90);
var _dir = darctan2(phy_linear_velocity_y, -phy_linear_velocity_x);
var _alpha = (_speed - limit_speed) / limit_speed;

// draw blur (only if ur over _limit_speed, speed)
if (_speed >= limit_speed) motion_blur(_speed / 2, _dir, _alpha);

// draw self
draw_sprite_ext(sprite_index, 0, x, y, 1, 1, _rot, c_white, 1);

reset_alpha();