for (var _i = 0; _i < ds_list_size(debug_messages); _i++)
{
	var _message = ds_list_find_value(debug_messages, _i);
	draw_text(0, _i * 8, _message);
}