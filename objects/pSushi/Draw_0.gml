/// @description Insert description here
// You can write your code in this editor
event_inherited();

draw_sprite_ext(sArrow, 0, x, y, force, 1, 0, c_green, 0.5);

if (sushi_invincible()) image_alpha = 0.5;
else image_alpha = 1;