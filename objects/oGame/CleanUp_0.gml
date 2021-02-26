/// @description delete level structs

var _len = array_length(levels);
for (var i = 0; i < _len; i++) delete levels[i];
levels = 0; // clear array