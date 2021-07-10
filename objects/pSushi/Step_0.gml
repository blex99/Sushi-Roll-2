/// @description control the sushi x and spin

if (level_is_state(LEVEL.PAUSED)) exit;

var _force_x, _force_y;
var _cam_deg = camera_get_deg();
var _sushi_dir = input_move_sushi();

sushi_cur_speed = sushi_get_speed();
ds_list_add(sushi_speeds, sushi_cur_speed);
sushi_speeds_len = ds_list_size(sushi_speeds);

if (sushi_speeds_len > 5)
{
	ds_list_delete(sushi_speeds, 0);
	sushi_speeds_len--;
}

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
	
	if (!played_splash)
	{
		jukebox_play_sfx(sfx_splash, false, 1, random_range(0.8, 1.2));
		played_splash = true;
	}
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
if (sushi_cur_speed >= limit_speed && phy_linear_velocity_y > 0 &&
	level_is_state(LEVEL.PLAYING) && !sushi_is_grounded())
{
	// if you've been free falling for awhile, play wind looping sound
	free_fall_buf = max(-1, free_fall_buf - 1);
	if (free_fall_buf <= 0)
	{
		var _volume_mult = sushi_cur_speed / limit_speed;
		jukebox_set_sfx_volume_mult(sfx_air_inst, _volume_mult, 100);
	}
}
else
{
	free_fall_buf = free_fall_buf_start;
	jukebox_set_sfx_volume_mult(sfx_air_inst, 0, 100);
}

// play sound
var _rot = round_to_nearest(-phy_rotation, 360)
if (rot_360 != _rot)
{
	rot_360 = _rot;

	var _volume = max(0.3, sushi_cur_speed / limit_speed);
	var _pitch = clamp(sushi_cur_speed / 60, 0.4, 1) + 0.5 + random_range(-0.05, 0.05);
	jukebox_play_sfx(sfx_roll, false, _volume, _pitch);
}
#endregion