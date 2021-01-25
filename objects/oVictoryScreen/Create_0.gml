
font = fnUI;
vertical_buffer = font_get_size(font);

x = 0;
y = 0;

frames_to_approach = room_speed;
alarm[0] = frames_to_approach;

xoffset_start = display_get_gui_width() / 2;
yoffset_start = 0;
xoffset = xoffset_start;
yoffset = yoffset_start;