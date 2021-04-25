/// @desc control platforms and mouse

if (level_is_state(LEVEL.PAUSED)) exit;

// rotate (with camera angle offset)
var _target_angle, _spd, _diff;
_target_angle = (input_rotate() * rot_limit) + camera_get_deg();
_diff = angle_difference(_target_angle, phy_rotation);
_spd = _diff * rot_strength;
phy_angular_velocity = clamp(_spd, -speed_max, speed_max);