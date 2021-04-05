print(image_angle);
print(phy_rotation);

phy_rotation = 0;

mass	= 2.0;
inertia	= 100;
physics_mass_properties(mass, 0, 0, inertia);

// establish joint
rot_strength			= 10;
rot_limit_upper_start	= rot_limit;
rot_limit_lower_start	= -1 * rot_limit;
rot_limit_upper			= rot_limit_upper_start;
rot_limit_lower			= rot_limit_lower_start;
speed_max				= 300;

var _ful = instance_create_layer(x, y, "Instances", oFulcrum);
joint = physics_joint_revolute_create(_ful, id, x, y,
	rot_limit_lower, rot_limit_upper, true, 0, 0, 0, 0);