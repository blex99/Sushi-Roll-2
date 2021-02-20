/// @description turn the trap door

var _angle_diff = angle_difference(phy_rotation, rot_target);
phy_angular_velocity =  _angle_diff * -rot_strength;

// force 0 degree angle if angle difference from the target is 5
if (_angle_diff < 1 && rot_target == 0)
	physics_joint_set_value(joint, phy_joint_angle_limits, true);
else
	physics_joint_set_value(joint, phy_joint_angle_limits, false);