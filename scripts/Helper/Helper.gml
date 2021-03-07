// helper functions

// converts the difficulty enum to string
function diff2str(_diff)
{
	switch(_diff)
	{
		case LEVEL_DIFF.BEGINNER:		return "Beginner";
		case LEVEL_DIFF.INTERMEDIATE:	return "Intermediate";
		case LEVEL_DIFF.EXPERT:			return "Expert";
	}
}

// draws text with a white background
function draw_text_with_outline(_x, _y, _string)
{
	// grab originally set color
	var _color = draw_get_color();
	
	draw_set_color(c_white);
	draw_text(_x + 1, _y, _string);
	draw_text(_x - 1, _y, _string);
	draw_text(_x, _y + 1, _string);
	draw_text(_x, _y - 1, _string);
	
	// reapply original color
	draw_set_color(_color);
	draw_text(_x, _y, _string);
}

// microseconds to seconds
function mus2sec(_microseconds)
{
	return _microseconds / 1000000;
}

// seconds to microseconds
function sec2mus(_seconds)
{
	return _seconds * 1000000;
}

// returns a string with 0's padded to the right
// EX: _string = "123", _total_digits = 4
// output: "0123"
function string_right_pad_zeros(_string, _total_digits)
{
	while (string_length(_string) < _total_digits)
		_string = string_insert("0", _string, 0);
	return _string
}

// returns the average given an array of nums
function average(_arr)
{
	var _sum = 0;
	var _len = array_length(_arr);
	for (var i = 0; i < _len; i++) _sum += _arr[i];
	return _sum / _len;
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