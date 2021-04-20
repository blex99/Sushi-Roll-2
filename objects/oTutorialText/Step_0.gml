/// @description Insert description here
// You can write your code in this editor

x = sushi_ref.x;
y = sushi_ref.y;

if (text_i == 0 &&
	level_is_state(LEVEL.PLAYING) && 
	(keyboard_check_pressed(ord("A")) || keyboard_check_pressed(ord("D"))))
{
	text_i = 1;
	alarm[0] = room_speed * 3;
}