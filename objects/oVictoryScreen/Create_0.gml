font = fnUI;
vertical_buffer = font_get_size(font);

x = 0;
y = 0;

frames_to_approach = room_speed;
alarm[0] = frames_to_approach;

xoffset_start = display_get_gui_width() / 2;
yoffset_start = 0;
xoffset = xoffset_start;
yoffset = yoffset_start;

var _stats = stats_get_array();
arr = [];
array_push(arr, 
	"Level Complete!\n",
	"----------------",
	"Points\n",
	"Time: "				+ _stats[0],
	"Rice: "				+ _stats[1], 
	"Collectibles: "		+ _stats[2] );

if (stats_collected_everything())
{
	array_push(arr, "Collector's Bonus: " + string(VALUE_COLLECT_EVERYTHING));
}
	
array_push(arr,
	"Level Score Total: "	+ _stats[3],
	"-----------------\n");

if (global.using_controller)
{
	array_push(arr, "Press A to Continue");
}
else
{
	array_push(arr, "Left Click to Continue");
}

len = array_length(arr);

