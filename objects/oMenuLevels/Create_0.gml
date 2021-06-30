/// @description set btn text + shader

// Inherit the parent event
event_inherited();

// set the background to be darker
var _layer = layer_get_id("Background");
bg_layer = layer_background_get_id(_layer);
layer_shader(_layer, shDarker);

alarm[2] = 2;