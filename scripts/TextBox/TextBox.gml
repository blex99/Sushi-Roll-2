// an dynamically sized text box abstraction so I don't have to 
// keep thinking about how large the text boxes should be.
// start_pos and target_pos must be Vector2's
// these positions are referring to the top left corner of the box
function text_box_create(_text, _start_pos, _target_pos, _font)
{
	if (0) return argument[0];

	if (_text == "") return;
	if (_font == undefined) _font = fnUI;
	if (_target_pos == undefined) _target_pos = _start_pos;

	var _buff = 32;
	var _area_index = game_get_area_index();
	if (_area_index == -1) _area_index = 0;

	var _layer_name = "UI";
	if (!layer_exists(_layer_name)) layer_create(-9999, _layer_name);
	
	with (instance_create_layer(0, 0, _layer_name, oTextBox))
	{
		text_box_font = _font;
		text_box_sprite = sNineSliceBox;
		text_box_sub_image = _area_index;
		text = _text;
		
		set_draw(c_black, 1, info_box_font, fa_center, fa_center);
		var _dynamic_width_pix = string_width(text) + _buff * 2;
		var _dynamic_height_pix = string_height(text) + _buff * 2;

		bw = _dynamic_width_pix;
		bh = _dynamic_height_pix;

		start_pos = _start_pos;
		cur_pos = _start_pos;
		target_pos = _target_pos;

		x1 = start_pos.x;
		y1 = start_pos.y;
		x2 = start_pos.x + bw;
		y2 = start_pos.y + bh;

		center_pos = Vector2(average([x1, x2]), average([y1, y2]));

		frames_to_approach = room_speed * 0.25;
		alarm[0] = frames_to_approach;

		ready_to_die = false;
		
		return self;
	}
}

function text_box_update_text(_text)
{
	with (oTextBox)
	{
		text = _text;
	}
}