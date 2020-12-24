xinput = 0;
xcenter = room_width * 0.5;
ycenter = room_height * 0.5;

torque = 2000;
angle_limit = 50;

var _rag = instance_create_layer(xcenter, ycenter, "Instances", oRagdoll);
var _fulcrum = instance_create_layer(xcenter, ycenter, "Instances", oFulcrum);

joint = physics_joint_revolute_create(_rag, _fulcrum, xcenter, ycenter, -angle_limit, angle_limit, 1, torque, 0, 1, 0);