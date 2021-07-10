/// @description SAVE, call user event 0 and hide debug

// hide DebugSprite asset layer
var _layer = layer_get_id("DebugSprites");
if (layer_exists(_layer)) layer_set_visible(_layer, false);

data_game_save();

event_user(0);