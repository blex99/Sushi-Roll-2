/// @description control the sushi x and spin

if (level_is_state(LEVEL.PAUSED)) exit;


var _cam_deg = camera_get_deg();
var _sushi_dir = input_move_sushi()
var _speed = sushi_get_speed();
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

// is free falling?
// TODO plays after you die sometimes
if (_speed >= limit_speed && phy_linear_velocity_y > 0 &&
	level_is_state(LEVEL.PLAYING) && !sushi_is_grounded())
{
	// if you've been free falling for awhile, play wind looping sound
	free_fall_buf = max(-1, free_fall_buf - 1);
	if (free_fall_buf <= 0)
	{
		var _volume = (_speed - limit_speed) / limit_speed;
		audio_sound_gain(sfx_air_inst, _volume, 100);
	}
}
else
{
	free_fall_buf = free_fall_buf_start;
	audio_sound_gain(sfx_air_inst, 0, 100);
}

// play sound
var _rot = round_to_nearest(-phy_rotation, 360)
if (rot_360 != _rot)
{
	rot_360 = _rot;
	
	// TODO use jukebox
	audio_play_sound(sfx_roll, 0, false);
	
	var _volume = clamp(_speed / 40, 0, jukebox_get_sfx_volume());
	var _pitch = clamp(_speed / 60, 0.4, 1);
	audio_sound_gain(sfx_roll, _volume, 10);
	audio_sound_pitch(sfx_roll, _pitch + 0.5 + random_range(-0.05, 0.05));
}
#endregion