/// @description turn the trap door

if (level_is_state(LEVEL.PAUSED)) exit;

angle_diff = angle_difference(phy_rotation, rot_target);
phy_angular_velocity = angle_diff * -rot_strength;

// force 0 degree angle if angle difference from the target is 5
if (angle_diff < 1 && rot_target == 0)
	physics_joint_set_value(joint, phy_joint_angle_limits, true);
else
	physics_joint_set_value(joint, phy_joint_angle_limits, false);

if ((alarm[0] != -1 && alarm[0] < room_speed) ||
	(alarm[1] != -1 && alarm[1] < room_speed) )
	image_alpha = oscillate(0.5, 1, 0.25);
else
	image_alpha = 1;