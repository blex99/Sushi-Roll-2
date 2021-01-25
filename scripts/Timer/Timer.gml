function timer_create(_start_timer_in_seconds, _script, _args)
{
	if (0) return argument[0];
	if (_args == undefined) _args = [];
	
	var _layer_name = "UI";
	if (!layer_exists(_layer_name)) layer_create(-9999, _layer_name);
	
	var _inst = instance_create_layer(0, 0, _layer_name, oTimer);
	
	with (_inst)
	{
		timer = room_speed * _start_timer_in_seconds;
		my_script = _script;
		my_script_args = _args;
	}
	
	return _inst;
}

function timer_get_time()
{
	if (!instance_exists(oTimer)) return 0;
	
	with (oTimer) return timer;
}

function timer_set_zero()
{
	if (!instance_exists(oTimer)) return;
	
	with (oTimer) timer = 0;
}

function timer_calc_time_bonus()
{
	if (!instance_exists(oTimer)) return 0;
	
	with (oTimer)
	{
		return VALUE_TIME * ceil(timer / room_speed);
	}
}

function timer_freeze()
{
	if (!instance_exists(oTimer)) return false;
	
	with (oTimer)
	{
		timer_frozen = true;
	}
}