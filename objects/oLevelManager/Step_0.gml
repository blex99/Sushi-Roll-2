/// @description checks if level complete

ui_alpha = max(ui_alpha - (1 / room_speed), 0);

if (level_complete && input_one_pressed())
{
	game_goto_next_level();
	level_complete = false;
}