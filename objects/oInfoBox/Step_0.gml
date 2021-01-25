/// @description update positions

var _norm = abs(1 - alarm[0] / frames_to_approach);
var _gw_half = display_get_gui_width() / 2;
var _gh_half = display_get_gui_height() / 2;
_norm = clamp(_norm, 0, 1);

xoffset = lerp(xoffset_start, xtarget, _norm);
yoffset = lerp(yoffset_start, ytarget, _norm);

x1 = _gw_half - bw_half + xoffset;
y1 = _gh_half - bh_half + yoffset;
x2 = _gw_half + bw_half + xoffset;
y2 = _gh_half + bh_half + yoffset;
xcenter = (x1 + x2) * 0.5;
ycenter = (y1 + y2) * 0.5;