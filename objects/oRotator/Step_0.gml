xinput = keyboard_check(vk_left) - keyboard_check(vk_right);
shift = keyboard_check(vk_lshift);

// half torque if not holding shift
pRagdoll.image_blend = (shift) ? c_red : c_white;
torque = max_torque * ((shift) ? 2 : 1) * xinput;

physics_joint_set_value(joint, phy_joint_max_motor_torque, abs(torque));
physics_joint_set_value(joint, phy_joint_motor_speed, torque);

add_to_debug_map("phy_speed", "phy_speed: " + string(instance_nearest(x, y, oChopstick).phy_speed));