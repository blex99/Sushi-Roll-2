var _msg = "";
var _ybuffer = 0;

_msg = "xinput: " + string(xinput);
draw_text(0, _ybuffer, _msg);
_ybuffer += 10;

_msg = "phy_angular_velocity: " + string(oRagdoll.phy_angular_velocity);
draw_text(0, _ybuffer, _msg);
_ybuffer += 10;