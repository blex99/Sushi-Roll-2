// create an info box to the bottom left of the screen
// _info_id is a unique string, like "Music Volume".
// if there is a new info box with the same id, the old
// one will be removed. this prevents the same message appearing
// multiple times.
function info_box_create(_text, _info_id)
{
	if (0) return argument[0];
	
	// if no id is set, make it whatever the text is
	if (_info_id == undefined) _info_id = _text;
	
	var _gw_half = GUI_W / 2;
	var _gh_half = GUI_H / 2
	
	// there can only be ONE info box FOR EACH slot
	var _num_info_box = instance_number(oInfoBox);
	var _slot_num = 0;
	
	// if there are more than FIVE infoboxes, remove the 1st one
	if (_num_info_box >= 5)
	{
		instance_destroy(instance_find(oInfoBox, 0));
	}
	
	// remove info boxes with the same info id
	for (var i = 0; i < _num_info_box; i++)
	{
		var _other = instance_find(oInfoBox, i);
		if (_other.info_id == _info_id)
			instance_destroy(_other);
	}

	// find the next availible slot (for y-offset)
	for (_slot_num = 0; _slot_num < _num_info_box; _slot_num++)
	{
		// is this slot UNIQUE?
		var _is_unique = true;
		for (var i = 0; i < _num_info_box; i++)
		{
			var _other = instance_find(oInfoBox, i);
			if (_other != noone && _other.slot_num == _slot_num)
				_is_unique = false;
		}
		
		if (_is_unique) break;
	}
	
	var _layer_name = "UI";
	if (!layer_exists(_layer_name)) layer_create(-9999, _layer_name);
	
	var _inst = instance_create_layer(0, 0, _layer_name, oInfoBox);
	
	with (_inst)
	{
		slot_num = _slot_num;
		info_id = _info_id;
		
		info_box_font = fnDebug;
		info_box_sprite = sNineSliceBox;
		text = _text;
		alpha = 1;
		
		draw_set_font(info_box_font);
		var _dynamic_width_pix = string_width(text) + 32;
		var _dynamic_height_pix = font_get_size(info_box_font) * 3;
		
		bw = _dynamic_width_pix;
		bh = _dynamic_height_pix;
		
		bw_half = bw * 0.5;
		bh_half = bh * 0.5;
		
		xoffset_start = - _gw_half - bw_half;
		yoffset_start = _gh_half - bh_half - (slot_num * bh);
		
		xoffset = xoffset_start;
		yoffset = yoffset_start;
		
		xtarget = - _gw_half + bw_half;
		ytarget = yoffset_start; // it doesn't move in the y-direction
		
		x1 = _gw_half - bw_half + xoffset;
		y1 = _gh_half - bh_half + yoffset;
		x2 = _gw_half + bw_half + xoffset;
		y2 = _gh_half + bh_half + yoffset;
		
		xcenter = (x1 + x2) * 0.5;
		ycenter = (y1 + y2) * 0.5;
		
		frames_to_approach = room_speed * 0.25;
		alarm[0] = frames_to_approach;
		
		ready_to_die = false;
	}
	
	return _inst;
}