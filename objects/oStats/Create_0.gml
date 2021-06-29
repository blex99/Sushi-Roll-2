/// @description sprite and point values

border_sprite = sNineSliceBox;
buffer = 16; // pixels away from the screen's corner
collectible_size = sprite_get_height(sCollectibleOrange) * 0.75;

var _msg = "Rice: 00";
item_font = fnUI; draw_set_font(item_font);
item_box_width = string_width(_msg) + collectible_size * 2 + buffer * 4;
item_box_height = max(string_height(_msg), collectible_size) + buffer;

var _msg = "00 mph";
speed_font = fnUIBig; draw_set_font(speed_font);
speed_box_width = string_width(_msg) + buffer * 2;
speed_box_height = string_height(_msg);