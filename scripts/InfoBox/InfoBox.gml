// create an info box to the bottom left of the screen
function info_box_create(_text)
{
	var _gw_half = display_get_gui_width() / 2;
	var _gh_half = display_get_gui_height() / 2;
	
	var _layer_name = "UI";
	if (!layer_exists(_layer_name)) layer_create(-9999, _layer_name);
	
	// there can be only one info box...
	if (instance_exists(oInfoBox)) instance_destroy(oInfoBox);
	
	var _inst = instance_create_layer(0, 0, _layer_name, oInfoBox);
	
	with (_inst)
	{
		info_box_font = fnDebug;
		info_box_sprite = sNineSliceBoxBamboo;
		text = _text;
		
		draw_set_font(info_box_font);
		var _dynamic_width_pix = string_width(text) + 32;
		var _dynamic_height_pix = font_get_size(info_box_font) * 3;
		
		bw = _dynamic_width_pix;
		bh = _dynamic_height_pix;
		
		bw_half = bw * 0.5;
		bh_half = bh * 0.5;
		
		xoffset_start = - _gw_half - bw_half;
		yoffset_start = _gh_half - bh_half;
		
		xoffset = xoffset_start;
		yoffset = yoffset_start;
		
		xtarget = - _gw_half + bw_half;
		ytarget = _gh_half - bh_half;
		
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