/// @description wait to move, check if die

if (ready_to_die)
{
	instance_destroy();
	exit;
}

alarm[1] = room_speed * 2;