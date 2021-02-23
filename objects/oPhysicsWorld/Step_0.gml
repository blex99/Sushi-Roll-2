/// @description Insert description here
// You can write your code in this editor

if (debug_mode && keyboard_check_pressed(ord("P")))
{
	physics_paused = !physics_paused;
	physics_pause_enable(physics_paused);
}