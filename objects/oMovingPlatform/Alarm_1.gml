/// @description create path indicator

var _dot = path_dot_create(x + sprite_width / 2, y + sprite_height / 2,
	room_speed * 4);
ds_list_add(path_dots, _dot);
alarm[1] = room_speed / 3;