/// @description decrement timer and check if time is up

if (timer_frozen) exit;

timer = max(0, timer - 1);
if (timer == 0)
{
	script_execute_args(my_script, my_script_args);
	instance_destroy();
}