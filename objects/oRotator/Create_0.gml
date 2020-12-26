xinput = 0;
xcenter = room_width * 0.5;
ycenter = room_height * 0.5;

max_torque = 8000;
torque = max_torque;
angle_limit = 50;

var _rag = instance_create_layer(xcenter, ycenter, "Instances", oRagdollCore);
var _fulcrum = instance_create_layer(xcenter, ycenter, "Instances", oFulcrum);

joint = physics_joint_revolute_create(_rag, _fulcrum, xcenter, ycenter, 
	-angle_limit, angle_limit, true, max_torque, 0, true, false);