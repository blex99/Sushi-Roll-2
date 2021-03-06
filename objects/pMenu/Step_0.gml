/// @description menu controls

if (!instance_exists(pButton) || !menu_control || alarm[1] != -1) exit;

var _len = array_length(buttons);

// keyboard/controller
var _horizontal = input_right() - input_left();
var _vertical = input_down() - input_up();
if (_horizontal != 0) _vertical = 0;

add_to_debug_map("c: " + string(gamepad_axis_value(global.device_index, gp_axislv)));

// reset dir_locked immediately
if ((!(_vertical < 0)	&& dir_locked == DIR.U) ||
	(!(_vertical > 0)	&& dir_locked == DIR.D) ||
	(!(_horizontal < 0)	&& dir_locked == DIR.L) ||
	(!(_horizontal > 0)	&& dir_locked == DIR.R) )
{
	dir_locked = DIR.NA;
	alarm[3] = -1;
}

// reset dir_locked eventually (if holding one direction)
if ((_horizontal != 0 || _vertical != 0) && alarm[3] == -1)
	alarm[3] = room_speed * key_lock_time;

// move the cursor
for (var i = 0; i < 4; i++)
{
	var _input_condition = 0;
	switch (i)
	{
		case DIR.U: _input_condition = _vertical < 0; break;
		case DIR.D: _input_condition = _vertical > 0; break;
		case DIR.L: _input_condition = _horizontal < 0; break;
		case DIR.R: _input_condition = _horizontal > 0; break;
	}
	
	if (_input_condition && menu_cursor.dir[i] >= 0 && dir_locked != i)
	{
		dir_locked = i;
		menu_cursor = buttons[menu_cursor.dir[i]];
	}
}
	
// select currently hovered button
if (keyboard_check_pressed(ord("X")) || gamepad_button_check(global.device_index, gp_face1))
{
	menu_committed = menu_cursor;
	menu_control = false;
}
	
// exit room, go to the previous room
if (keyboard_check_pressed(vk_escape) || gamepad_button_check(global.device_index, gp_face2))
{
	transition_start(my_previous_room);
	exit;
}

// mouse detection and button controller
for (var i = 0; i < _len; i++)
{
	var b = buttons[i];
	
	// override cursor and commited vars if needed
	if (menu_control && !global.using_controller &&
		MOUSE_GUI_X > b.x1 && MOUSE_GUI_X < b.x2 &&
		MOUSE_GUI_Y > b.y1 && MOUSE_GUI_Y < b.y2)
	{
		menu_cursor = b;
		if (MOUSE_LEFT && !global.using_controller)
		{
			menu_committed = b;
			menu_control = false;
		}
	}

	if (b == menu_committed)
	{
		b.sub_image = BUTTON.PRESSED;
		if (alarm[0] == -1) alarm[0] = 10;
	}
	else if (b == menu_cursor)
	{
		b.sub_image = BUTTON.HOVERING;
	}
	else
	{
		b.sub_image = BUTTON.IDLE;
	}
}