// helper functions

function set_draw(_valign, _halign, _color, _alpha)
{
	draw_set_valign(_valign);
	draw_set_halign(_halign);
	draw_set_color(_color);
	draw_set_alpha(_alpha);
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