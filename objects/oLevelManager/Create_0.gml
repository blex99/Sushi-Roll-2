/// @desc inits all needed obj's for a level

instance_create_layer(0, 0, "Instances", oCamera);
instance_create_layer(0, 0, "Instances", oPhysicsWorld);
instance_create_layer(0, 0, "Instances", oLevelController);
instance_create_layer(0, 0, "Instances", oStats);
window_set_cursor(cr_none);