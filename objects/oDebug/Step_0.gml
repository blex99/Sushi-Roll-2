if (keyboard_check(vk_escape)) game_end();
if (keyboard_check(ord("R"))) game_restart();

debug_messages = ds_list_create();
ds_list_add(debug_messages, "~~ DEBUG ~~");