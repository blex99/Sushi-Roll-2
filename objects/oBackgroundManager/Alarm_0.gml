/// @description change background based on area
var i = game_get_area_index();
switch (i)
{
	case LEVEL_AREA.KITCHEN:
		layer_background_sprite(bg_layer, sKitchenBackground);
		break;
	case LEVEL_AREA.BAMBOO:
		layer_background_sprite(bg_layer, sBambooBackground);
		break;
	case LEVEL_AREA.PAINT:
		layer_background_sprite(bg_layer, sPaintBackground);
		break;
	case LEVEL_AREA.SKY_TEMPLE:
		layer_background_sprite(bg_layer, sSkyTempleBackground);
		break;
}