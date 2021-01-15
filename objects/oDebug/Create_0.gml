if (!debug_mode) instance_destroy();
debug_messages = ds_map_create();

// setting to true with display debug elements
// setting to false hides debug elements even when in debug mode
// can be toggled with D
show_debug = false;