enabled_deadzone = false;
angular_spd = 250;
angle_limit = 50;
xmouse = 0;

w = display_get_gui_width();
h = display_get_gui_height();
w_half = w * 0.5;
h_half = h * 0.5;
max_range = w * 0.2;
w_min = w_half - max_range;
w_max = w_half + max_range;

deadzone = w * 0.01;
xdeadzone_min = w_half - deadzone;
xdeadzone_max = w_half + deadzone;

var _xroomcenter = room_width * 0.5;
var _yroomcenter = room_height * 0.5;
var _rag = instance_create_layer(_xroomcenter, _yroomcenter, "Instances",
	oRagdollCore);
var _fulcrum = instance_create_layer(_xroomcenter, _yroomcenter, "Instances",
	oFulcrum);

physics_joint_revolute_create(_rag, _fulcrum, _xroomcenter, _yroomcenter,
	-angle_limit, angle_limit, true, 0, 0, 0, 0);
	