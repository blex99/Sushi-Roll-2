/// @description lerp position

var _norm = abs(1 - alarm[0] / frames_to_approach);
_norm = clamp(_norm, 0, 1);

xoffset = lerp(xoffset_start, 0, easeOutElastic(_norm));
yoffset = lerp(yoffset_start, 0, easeOutElastic(_norm));