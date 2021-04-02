
debug_messages = ds_map_create();
if (!debug_mode)
{
	instance_destroy();
	exit;
}

// setting to true with display debug elements
// setting to false hides debug elements even when in debug mode
show_debug = DEBUG_SHOW_VISUALS;