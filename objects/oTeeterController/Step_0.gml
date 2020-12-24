xinput = keyboard_check(ord("A")) - keyboard_check(ord("D"));
physics_joint_set_value(joint, phy_joint_motor_speed, xinput * torque);
