/// @description draw 

if (can_display_debug()) 
{
	physics_draw_debug();
}

var _limit_speed = 40;
var _speed = sushi_get_speed();
var _rot = round(-phy_rotation / 90) * 90;
var _dir = darctan2(phy_linear_velocity_y, -phy_linear_velocity_x);
var _alpha = (_speed - _limit_speed) / _limit_speed;

// draw blur (only if ur over _limit_speed, speed)
image_angle = _rot;
if (_speed >= _limit_speed) motion_blur(_speed / 2, _dir, _alpha);

// draw self
draw_sprite_ext(sprite_index, 0, x, y, 1, 1, _rot, c_white, 1);

reset_alpha();

add_to_debug_map("_speed: " + string(_speed));