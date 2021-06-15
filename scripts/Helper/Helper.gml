// helper functions

// find's the position of the i'th element AWAY from the center of a list
// _offset = find_position_from_center(i, len, buffer)
function find_position_from_center(_index, _arr_len, _buffer, _center_pos)
{
	if (0) return argument[0];
	if (_center_pos == undefined) _center_pos = 0;
	
	var _center, _standardized;
	_center = floor(_arr_len / 2);
	_standardized = _index - _center;
	if (_arr_len % 2 == 0) _standardized += 0.5; // even offset
	
	print(string(_standardized) + " + " + string(_arr_len));
	return _standardized * _buffer + _center_pos;
}

function round_to_nearest(_val, _round)
{
	return round(_val / _round) * _round;
}

// draws many versions of the same image
// length = length of blur, real
// direction = direction of blur in degrees, real
//
// https://www.gmlscripts.com/script/motion_blur
function motion_blur(_length, _direction, _alpha)
{
	if (_length > 0 && _alpha > 0)
	{
		var _step = 2;
		var _dir = degtorad(_direction);
		var _px = cos(_dir);
		var _py = -sin(_dir);
		var _a = min(1, _alpha / (_length / _step));

		for(var i = 0; i < _length; i += _step)
		{
			draw_sprite_ext(sprite_index, image_index, x + (_px * i), y + (_py * i),
				image_xscale, image_yscale, image_angle, image_blend, _a);
			_a *= 0.9;
		}
	}
}

function easeInSine(_source, _target, _num)
{
	var _t = 1 - cos((_num * pi) / 2)
	return _source + _t * (_target - _source);
}

function easeInCirc(_source, _target, _num)
{
	var _a = max(1 - power(_num, 2), 0);
	var _t = 1 - sqrt(_a);
	return _source + _t * (_target - _source);
}

function my_lerp(_v0, _v1, _t)
{
	return _v0 + _t * (_v1 - _v0);
}

// degrees to cardinal directions
// EX: 180 degrees -> 2
function deg2card(_deg)
{
	return round(_deg / 90);
}

// cardinal directions to degrees
// EX: 3 -> 270 degrees
function card2deg(_card)
{
	return _card * 90;
}

// converts the difficulty enum to string
function diff2str(_diff)
{
	switch(_diff)
	{
		case LEVEL_AREA.BEGINNER:		return "Beginner";
		case LEVEL_AREA.INTERMEDIATE:	return "Intermediate";
		case LEVEL_AREA.EXPERT:			return "Expert";
		case LEVEL_AREA.MASTER:			return "Master";
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