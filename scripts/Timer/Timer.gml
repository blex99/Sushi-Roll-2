function timer_create(_start_timer_mus, _timer_counts_down, _script, _args)
{
	if (0) return argument[0];
	if (_args == undefined) _args = [];
	
	var _layer_name = "UI";
	if (!layer_exists(_layer_name)) layer_create(-9999, _layer_name);
	
	var _inst = instance_create_layer(0, 0, _layer_name, oTimer);
	
	with (_inst)
	{
		timer = _start_timer_mus;
		my_script = _script;
		my_script_args = _args;
		timer_counts_down = _timer_counts_down;
	}
	
	return _inst;
}

// in microseconds
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

function timer_freeze()
{
	if (!instance_exists(oTimer)) return false;
	
	with (oTimer)
	{
		timer_frozen = true;
	}
}