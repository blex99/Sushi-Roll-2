/// @description menu controls

if (!instance_exists(pButton)) exit;
if (!menu_control) exit;
if (alarm[1] != -1) exit;

var _len = array_length(buttons);

// keyboard/controller
var _horizontal = input_right() - input_left();
var _vertical = input_down() - input_up();
if (_horizontal != 0) _vertical = 0;

add_to_debug_map("controller: " + string(gamepad_axis_value(global.device_index, gp_axislh)));

if (_horizontal != 0 || _vertical != 0)
{
	// reset key_previous
	if (alarm[3] == -1) alarm[3] = room_speed * 0.5;
}

// move the cursor
if (_vertical < 0 && menu_cursor.up >= 0 && key_previous != "up")
{
	key_previous = "up";
	menu_cursor = buttons[menu_cursor.up];
}
else if (_vertical > 0 && menu_cursor.down >= 0 && key_previous != "down")
{
	key_previous = "down";
	menu_cursor = buttons[menu_cursor.down];
}
else if (_horizontal > 0 && menu_cursor.left >= 0 && key_previous != "left")
{
	key_previous = "left";
	menu_cursor = buttons[menu_cursor.left];
}
else if (_horizontal < 0 && menu_cursor.right >= 0 && key_previous != "right")
{
	key_previous = "right";
	menu_cursor = buttons[menu_cursor.right];
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