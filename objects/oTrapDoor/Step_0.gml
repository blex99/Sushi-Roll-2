/// @description trap door state calls

if (level_is_state(LEVEL.PAUSED)) exit;

script_execute(state);

add_to_debug_map("is_down: " + string(is_down));


var _lim = physics_joint_get_value(joint, phy_joint_angle_limits);

add_to_debug_map("_lim: " + string(_lim));