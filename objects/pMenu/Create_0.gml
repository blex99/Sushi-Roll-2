/// @desc init vars

// buttons are ordered by their ptag
var _len = instance_number(pButton);
buttons = array_create(_len);

alarm[1] = 1;

dir_locked = DIR.NA;
key_lock_time = 0.35; // seconds
menu_cursor = noone;
menu_committed = noone;
menu_control = true;

// sounds
sfx_back = sfxBack;
sfx_hover = sfxHover;
sfx_select = sfxSelect;
sfx_select_level = sfxSelectLevel;