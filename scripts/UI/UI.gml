function ui_create_button(_text, _xoffset, _yoffset, _xtarget, _ytarget, _script, _args)
{
	if (0) return argument[0];
	if (_args == undefined) _args = [];
	
	var _layer_name = "UI";
	if (!layer_exists(_layer_name)) layer_create(-9999, _layer_name);
	
	var _inst = instance_create_layer(0, 0, _layer_name, oButton);
	
	with (_inst)
	{
		button_font = fnDebug;
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
		bw = 256;
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
		
		frames_to_approach = room_speed * 2;
		alarm[0] = frames_to_approach;
		
		// 0 - normal
		// 1 - hover
		// 2 - click
		sub_image = 0;
	}
	
	return _inst;
}

function ui_nine_slice_box(_sprite, _x1, _y1, _x2, _y2, _sub_image){
	if (0) return argument[0];
	
	if (_sub_image == undefined) _sub_image = 0;
	
	var _size = sprite_get_width(_sprite) / 3;
    var _w = _x2 - _x1;
    var _h = _y2 - _y1;
	
	draw_set_color(c_white);
	draw_set_alpha(1);

    // MIDDLE
    draw_sprite_part_ext(_sprite, _sub_image, _size, _size, 1, 1, _x1+_size, _y1+_size,
        _w-(_size*2), _h-(_size*2), c_white, 1);

    // CORNERS
	// topleft
    draw_sprite_part(_sprite, _sub_image, 0, 0, _size, _size, _x1, _y1);
	// topright
    draw_sprite_part(_sprite, _sub_image, _size*2, 0, _size, _size, _x1+_w-_size, _y1);
	// bottomleft
    draw_sprite_part(_sprite, _sub_image, 0, _size*2, _size, _size, _x1, _y1+_h-_size);
	// bottomright
    draw_sprite_part(_sprite, _sub_image, _size*2, _size*2, _size, _size, _x1+_w-_size, _y1+_h-_size);

    // EDGES
	// left
	draw_sprite_part_ext(_sprite, _sub_image, 0, _size, _size, 1, _x1, _y1+_size, 1, _h-(_size*2), c_white, 1);
	// right
	draw_sprite_part_ext(_sprite, _sub_image, _size*2, _size, _size, 1, _x1+_w-_size, _y1+_size, 1, _h-(_size*2), c_white, 1);
	// top
	draw_sprite_part_ext(_sprite, _sub_image, _size, 0, 1, _size, _x1+_size, _y1, _w-(_size*2), 1, c_white, 1);
	// bottom
	draw_sprite_part_ext(_sprite, _sub_image, _size, _size*2, 1, _size, _x1+_size, _y1+_h-(_size), _w-(_size*2), 1, c_white, 1);
}