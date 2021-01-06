/// @desc control platforms and sushi's x velocity

if (keyboard_check(vk_escape)) game_end();
if (keyboard_check(ord("R"))) room_restart();
if (keyboard_check(ord("O")))
	global.using_controller =! global.using_controller;

// clamp mouse to w_min and w_max
window_mouse_set(input_x_mouse_clamp(w_min, w_max), h_half); 

// rotating object idle
with (pRotateable)
{
	var _target_angle;
	if (active && input_two())	 _target_angle = input_x_axis() * angle_limit;
	else						 _target_angle = 0;
	
	var _spd = (_target_angle - phy_rotation) * other.rot_strength;
	if (input_controller_active()) _spd *= 0.75; // reduce spd with controller
	phy_angular_velocity = _spd;
}

// control the sushi x velocity
with (sushi_cur()) phy_linear_velocity_x += input_x_axis() * 1.25;