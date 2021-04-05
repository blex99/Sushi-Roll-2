// update limits of joint given camera angle
function rotateable_update_limits(_cam_deg)
{
	with (pRotateable)
	{
		rot_limit_upper = rot_limit_upper_start + _cam_deg;
		rot_limit_lower = rot_limit_lower_start + _cam_deg;
		
		physics_joint_set_value(joint, phy_joint_upper_angle_limit,
			rot_limit_upper);
		physics_joint_set_value(joint, phy_joint_lower_angle_limit,
			rot_limit_lower);
	}
}