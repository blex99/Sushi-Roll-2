var _ful = instance_create_layer(x, y, "Instances", oFulcrum);

physics_joint_revolute_create(_ful, id, x, y, -ROT_LIMIT, ROT_LIMIT, true, 0, 0, 0, 0);