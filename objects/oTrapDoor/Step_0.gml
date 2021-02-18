/// @description turn the trap door

var _strength = rot_strength;
var _angle_diff = angle_difference(phy_rotation, rot_target);
if (abs(_angle_diff) < 5) _strength = 25;

phy_angular_velocity =  _angle_diff * -_strength;