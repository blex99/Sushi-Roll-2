/// @description update positions and size dynamically

// fade the infobox out slowly
if (alarm[1] != -1) alpha = (alarm[1] / room_speed * 2) + 0.2;

var _gw_half = GUI_W / 2;
var _gh_half = GUI_H / 2;

// easing
var _norm = abs(1 - alarm[0] / frames_to_approach);
_norm = clamp(_norm, 0, 1);

// lerp
xoffset = lerp(xoffset_start, xtarget, _norm);
yoffset = lerp(yoffset_start, ytarget, _norm);

x1 = _gw_half - bw_half + xoffset;
y1 = _gh_half - bh_half + yoffset;
x2 = _gw_half + bw_half + xoffset;
y2 = _gh_half + bh_half + yoffset;
xcenter = (x1 + x2) * 0.5;
ycenter = (y1 + y2) * 0.5;