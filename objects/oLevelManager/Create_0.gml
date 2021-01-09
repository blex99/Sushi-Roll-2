/// @desc inits all needed obj's for a level

level_complete = false;
ui_alpha = 2; // also text fade duration in seconds

instance_create_layer(0, 0, "Instances", oTimer);
instance_create_layer(0, 0, "Instances", oCamera);
instance_create_layer(0, 0, "Instances", oPhysicsWorld);
instance_create_layer(0, 0, "Instances", oLevelController);
instance_create_layer(0, 0, "Instances", oStats);
window_set_cursor(cr_none);