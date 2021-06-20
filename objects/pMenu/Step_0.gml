/// @description menu controls

// exit of you're transitioning
if (oTransition.mode != TRANS_MODE.OFF) exit;

// exit if the room has no buttons, you're not controlling the menu, or
// you're currently initializing the menu vars
if (!instance_exists(pButton) || !menu_control || alarm[1] != -1) exit;

var _len = array_length(buttons);

// keyboard/controller
var _horizontal = input_right() - input_left();
var _vertical = input_down() - input_up();
if (_horizontal != 0) _vertical = 0;
var _up = _vertical < 0;
var _down = _vertical > 0;
var _left = _horizontal < 0;
var _right = _horizontal > 0;

// move the mouse if you're going to use the keyboard
var _mouse_moved = false; // mouse moved this frame?
if (_horizontal != 0 || _vertical != 0)
{
	window_mouse_set(0, 0);
	_mouse_moved = true;
}

// reset dir_locked immediately
if ((!_up		&& dir_locked == DIR.U) ||
	(!_down		&& dir_locked == DIR.D) ||
	(!_left		&& dir_locked == DIR.L) ||
	(!_right	&& dir_locked == DIR.R) )
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
		case DIR.U:	_input_condition = _up;		break;
		case DIR.D:	_input_condition = _down;	break;
		case DIR.L:	_input_condition = _left;	break;
		case DIR.R:	_input_condition = _right;	break;
	}
	
	if (_input_condition && menu_cursor.dir[i] >= 0 && dir_locked != i)
	{
		dir_locked = i;
		menu_cursor = buttons[menu_cursor.dir[i]];
		jukebox_play_sfx(sfx_hover);
	}
}
	
// select currently hovered button
// mouse controls are later...
if (input_one_pressed() && !MOUSE_LEFT)
{
	menu_committed = menu_cursor;
	menu_control = false;
}

// exit room, go to the previous room
if (input_back_pressed())
{
	menu_goto_previous_room();
	exit;
}

// mouse detection and button controller
for (var i = 0; i < _len; i++)
{
	var b = buttons[i];
	
	// override cursor and commited vars if needed
	if (menu_control && !global.using_controller &&
		MOUSE_GUI_X > b.x1 && MOUSE_GUI_X < b.x2 &&
		MOUSE_GUI_Y > b.y1 && MOUSE_GUI_Y < b.y2 &&
		!_mouse_moved)
	{
		// play a sound if you've hovered over something new
		if (b != menu_cursor)
			jukebox_play_sfx(sfx_hover);
		
		menu_cursor = b;

		if (MOUSE_LEFT)
		{
			menu_committed = b;
			menu_control = false;
		}
	}

	if (b == menu_committed)
	{
		b.button_state = BUTTON.PRESSED;
		if (alarm[0] == -1) alarm[0] = 10;
	}
	else if (b == menu_cursor)
	{
		b.button_state = BUTTON.HOVERING;
	}
	else
	{
		b.button_state = BUTTON.IDLE;
	}
}

add_to_debug_map("_mouse_moved: " + string(_mouse_moved));
add_to_debug_map("menu_control: " + string(menu_control));
add_to_debug_map("global.using_controller: " + string(global.using_controller));