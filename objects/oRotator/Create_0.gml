// input vars
xmouse = 0;

// vars
enabled_deadzone = false;
angular_spd_mult = 7; // angular speed multiplier
angle_limit = 50; // degrees

w = display_get_gui_width();
h = display_get_gui_height();
w_half = w * 0.5;
h_half = h * 0.5;
max_range = w * 0.2;
w_min = w_half - max_range;
w_max = w_half + max_range;

xdeadzone = w * 0.005;
xdeadzone_min = w_half - xdeadzone;
xdeadzone_max = w_half + xdeadzone;

var _xroomcenter = room_width * 0.5;
var _yroomcenter = room_height * 0.5;
var _rag = instance_create_layer(_xroomcenter, _yroomcenter, "Instances",
	oRagdollCore);
var _fulcrum = instance_create_layer(_xroomcenter, _yroomcenter, "Instances",
	oFulcrum);

physics_joint_revolute_create(_rag, _fulcrum, _xroomcenter, _yroomcenter,
	-angle_limit, angle_limit, true, 0, 0, 0, 0);
	