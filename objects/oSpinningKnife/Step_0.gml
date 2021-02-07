/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// spin (while you haven't hit the sushi...)
if (killed_sushi)
	spin_rate_per_frame	= approach(spin_rate_per_frame, 0, 0.1);

image_angle += spin_rate_per_frame * ((spin_clockwise) ? -1 : 1);