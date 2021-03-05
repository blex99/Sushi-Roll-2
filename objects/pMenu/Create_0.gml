/// @desc init vars

// buttons are ordered by their ptag
var _len = instance_number(pButton);
buttons = array_create(_len);

alarm[1] = 1;

key_previous = "";

menu_cursor = noone;
menu_committed = noone;
menu_control = true;