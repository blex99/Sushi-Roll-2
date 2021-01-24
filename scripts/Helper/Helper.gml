// helper functions

function toggle_fullscreen()
{
	window_set_fullscreen(!window_get_fullscreen());	
}

// input range between 0 and 1 ONLY
function easeOutElastic(_num) {
	var c4 = (2 * pi) / 3;

	if (_num <= 0) return 0;
	if (_num >= 1) return 1;
	
	return power(2, -10 * _num) * sin((_num * 10 - 0.75) * c4) + 1;
}

function script_execute_args(_script, _args)
{
	var _len = array_length(_args);
	
	switch (_len)
	{
		case 0: script_execute(_script); break;
		case 1: script_execute(_script, _args[0]); break;
		case 2: script_execute(_script, _args[0], _args[1]); break;
	}
}

function oscillate(_start, _amp_in_pix, _period_per_sec)
{
	var _sin = sin((2 * pi / _period_per_sec) * cur_second());
	return _amp_in_pix * _sin + _start;
}

// # of seconds since game start
function cur_second()
{
	return current_time * 0.001;
}

function set_draw(_color, _alpha, _font, _valign, _halign)
{
	if (0) return argument[0];
	if (_color != undefined)	draw_set_color(_color);
	if (_alpha != undefined)	draw_set_alpha(_alpha);
	if (_font != undefined)		draw_set_font(_font);
	if (_valign != undefined)	draw_set_valign(_valign);
	if (_halign != undefined)	draw_set_halign(_halign);
}

function approach(_current, _target, _delta)
{
	if (_current < _target)
	{
	    _current += _delta;
	    if (_current > _target)
	        return _target;
	}
	else
	{
	    _current -= _delta;
	    if (_current < _target)
	        return _target;
	}
	return _current;
}

function reset_alpha()
{
	draw_set_alpha(1);	
}