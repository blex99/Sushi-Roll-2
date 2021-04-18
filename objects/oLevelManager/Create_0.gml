/// @desc inits all needed obj's for a level

instance_create_layer(0, 0, "Instances", oPhysicsWorld);
instance_create_layer(0, 0, "Instances", oInput);
window_set_cursor(cr_none);

// set default value for mouse position
prev_mouse = Vector2(window_get_width() * 0.5, window_get_height() * 0.25);

// update the current level struct
level_struct = -1;
area_number = -1;
level_number = -1;
with (oGame)
{
	if (area_index == -1 || level_index == -1)
	{
		// set default vals in case unset level
		area_index = 0;
		level_index = 0;
	}
	
	other.area_number = area_index + 1;
	other.level_number = level_index + 1;
	other.level_struct = levels[area_index][level_index];
}

state = LEVEL.PANNING;
ui_alpha_start = 5;
ui_alpha = ui_alpha_start; // also text fade duration in seconds

#region create box around sushi
var _inst, _sushi = sushi_cur(), _w_half, _h_half;
_w_half = _sushi.sprite_width / 2;
_h_half = _sushi.sprite_height / 2;

// top
_inst = instance_create_layer(_sushi.x, _sushi.y - _h_half - 1, "Instances", oInvisibleSushiHolder);
// bottom
_inst = instance_create_layer(_sushi.x, _sushi.y + _h_half + 1, "Instances", oInvisibleSushiHolder);
// left
_inst = instance_create_layer(_sushi.x -_w_half - 1, _sushi.y, "Instances", oInvisibleSushiHolder);
_inst.phy_rotation = 90;
// right
_inst = instance_create_layer(_sushi.x +_w_half + 1, _sushi.y, "Instances", oInvisibleSushiHolder);
_inst.phy_rotation = 90;
#endregion