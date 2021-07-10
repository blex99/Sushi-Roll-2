#macro BASE_W 960
#macro BASE_H 540
#macro GUI_W 960 // TODO double
#macro GUI_H 540
#macro WATERDIVISION 16 // smaller division -> more lag
#macro MOUSE_GUI_X device_mouse_x_to_gui(0)
#macro MOUSE_GUI_Y device_mouse_y_to_gui(0)
#macro MOUSE_LEFT mouse_check_button_pressed(mb_left)
#macro CAM view_camera[0]
#macro AREA_UNLOCK_REQ 5 // ...levels to complete
#macro MAX_LEVELS_PER_AREA 5

global.debug = 
{
	starting_room:	rMenuMain,
	show_debug:		true,
	load_data:		true,
	unlock_all:		true,
	play_music:		true,
	set_default_values : function()
	{
		starting_room	= rMenuMain;
		show_debug		= false;
		load_data		= true;
		unlock_all		= false;
		play_music		= true;
	},
};
if (!debug_mode) global.debug.set_default_values();

// in quadrant order
enum DIR
{
	R, // right
	U, // up
	L, // left
	D, // down
	NA // none
}

enum LEVEL_AREA
{
	KITCHEN,
	BAMBOO,
	PAINT,
	SKY_TEMPLE,
	COUNT // = 4, the size of the enum
}

// for oLevel
enum LEVEL
{
	PANNING,
	COUNTING_DOWN,
	PLAYING,
	PAUSED,
	COMPLETE
}

// for oTransition
enum TRANS_MODE
{
	OFF,
	GOTO,
	INTRO
}

// for oMenu/oButton
enum BUTTON
{
	IDLE,
	HOVERING,
	PRESSED
}