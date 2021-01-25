/// @description move back to starting position

xtarget = xoffset_start;
ytarget = yoffset_start;

xoffset_start = xoffset;
yoffset_start = yoffset;

// die next time alarm[0] hits...
alarm[0] = frames_to_approach;
ready_to_die = true;