/// @description control the sushi x and spin

if (level_is_state(LEVEL.PAUSED)) exit;


var _cam_deg = camera_get_deg();
var _sushi_dir = input_move_sushi()
var _force_x, _force_y;

#region control the sushi


_force_x = lengthdir_x(force, _cam_deg) * _sushi_dir;
_force_y = -1 * lengthdir_y(force, _cam_deg) * _sushi_dir;
physics_apply_force(x, y, _force_x, _force_y);

// apply more torque to the sushi if they're on the ground
var _torque = _sushi_dir * torque;
physics_apply_torque(_torque);
jump_buffer = max(0, jump_buffer - 1);

#endregion

#region water interaction
if (place_meeting(x, y, oWaterBody))
{
	var _water = instance_place(x, y, oWaterBody);
	water_cause_wave(_water, x);
	phy_linear_damping = 5;
}
else
{
	phy_linear_damping = linear_damp;
}
#endregion

#region animation and sounds
// shrink and grow animation
if (image_xscale != target_scale ||
	image_yscale != target_scale )
{
	image_xscale = lerp(image_xscale, target_scale, 0.25);
	image_yscale = lerp(image_yscale, target_scale, 0.25);
	sushi_init_fixture();
}

/*
if (sushi_get_speed() > 5 && level_is_state(LEVEL.PLAYING)
	&& sushi_is_grounded())
{
	// play rolling sound
	var _volume = clamp(sushi_get_speed() / 50, 0, 1);
	audio_sound_gain(sfx_roll, _volume, 100);
	
	var _pitch = clamp(sushi_get_speed() / 50, 0, 1);
	audio_sound_pitch(sfx_roll, _pitch + 0.5);
}
else
{
	audio_sound_gain(sfx_roll, 0, 100);
}
*/

add_to_debug_map("phy_angular_velocity: " + string(phy_angular_velocity));


#endregion

