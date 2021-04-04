rot_strength = 10;
rot_limit = rot_limit_start; // in degrees

speed_max = 300;

mass = 2.0;
inertia = 100;
physics_mass_properties(mass, 0, 0, inertia);

// stats for the WINDOW
w = window_get_width();
h = window_get_height();
w_half = w * 0.5;
h_half = h * 0.5;
max_range = w * 0.1;
w_min = w_half - max_range;
w_max = w_half + max_range;

// establish joint
var _ful = instance_create_layer(x, y, "Instances", oFulcrum);
joint = physics_joint_revolute_create(_ful, id, x, y, -rot_limit, rot_limit,
	true, 0, 0, 0, 0);
	

