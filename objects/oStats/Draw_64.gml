var _count = 0;
var _buff = 16;
var _w = display_get_gui_width();
var _h = display_get_gui_height();
var _arr =
[
	"Level Complete!",
	"Score: " + string(level_score), 
	"Time: " + string(level_timer / room_speed),
	"Rice Count: " + string(rice_count) + " / " + string(rice_max), 
	"Collectibles: " + string(collectible_count) + " / " + string(collectible_max),
	"Press Left Click or A to Continue"
];

if (is_level_complete())
{
	set_draw(fa_center, fa_center, c_black, 0.5);
	draw_rectangle(0, 0, _w, _h, false);
	
	set_draw(fa_center, fa_center, c_white, 1);
	for (_count = 0; _count < array_length(_arr); _count++)
		draw_text(_w / 2, (_h / 3) + (_buff * _count), _arr[_count]);
}
else
{
	if (level_timer < room_speed * 10)
	{
		set_draw(fa_center, fa_center, c_red, 0.2);
		draw_rectangle(0, 0, _w, _h, false)
	}
	
	set_draw(fa_top, fa_left, c_black, 1);
	// starting count at one to skip the "level complete message"
	for (_count = 1; _count < array_length(_arr) - 1; _count++)
		draw_text(0, _buff * (_count - 1), _arr[_count]);
}