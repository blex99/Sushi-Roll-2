if (keyboard_check(vk_escape)) game_end();
if (keyboard_check(ord("R"))) game_restart();
if (keyboard_check(ord("P"))) room_goto(rLevel2);