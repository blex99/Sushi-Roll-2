if (keyboard_check(vk_escape)) game_end();
if (keyboard_check(ord("R"))) game_restart();

debug_messages = ds_map_create();
ds_map_add(debug_messages, "test", "testing something");