
debug_messages = ds_map_create();
if (!debug_mode)
{
	instance_destroy();
	exit;
}