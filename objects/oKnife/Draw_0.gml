/// @description draw path if debug
draw_self();
if (debug_mode && path != -1 && path_exists(path)) draw_path(path, xstart, ystart, false);