function button_create(_text, _xoffset, _yoffset, _xtarget, _ytarget, _script, _args)
{
	if (0) return argument[0];
	if (_args == undefined) _args = [];
	
	var _layer_name = "UI";
	if (!layer_exists(_layer_name)) layer_create(-9999, _layer_name);
	
	var _inst = instance_create_layer(0, 0, _layer_name, oButton);
	
	with (_inst)
	{
		button_font = fnDebug;
		button_sprite = sNineSliceBoxButton;
		text = _text;
		
		xoffset_start = _xoffset;
		yoffset_start = _yoffset;
		
		xoffset = _xoffset;
		yoffset = _yoffset;
		
		xtarget = _xtarget;
		ytarget = _ytarget;
		
		my_script = _script;
		my_script_args = _args;
		
		// button height/width
		bw = button_get_width();
		bh = 48;
		bw_half = bw * 0.5;
		bh_half = bh * 0.5;
		
		var _gw_half = display_get_gui_width() / 2;
		var _gh_half = display_get_gui_height() / 2;
		
		x1 = _gw_half - bw_half + xoffset;
		y1 = _gh_half - bh_half + yoffset;
		x2 = _gw_half + bw_half + xoffset;
		y2 = _gh_half + bh_half + yoffset;
		
		xcenter = (x1 + x2) * 0.5;
		ycenter = (y1 + y2) * 0.5;
		
		frames_to_approach = room_speed;
		alarm[0] = frames_to_approach;
		
		// 0 - normal
		// 1 - hover
		// 2 - click
		sub_image = 0;
	}
	
	return _inst;
}

function button_reset_positions()
{
	with (oButton)
	{	
		alarm[0] = frames_to_approach;
	}
}

function button_get_width()
{
	return 256;	
}