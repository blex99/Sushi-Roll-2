/// @description draw mouse position
if (level_is_state_playing() && !global.using_controller)
{
	draw_circle(MOUSE_GUI_X, display_get_gui_height() / 2, 2, false);
}