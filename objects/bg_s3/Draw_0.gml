/// @description Insert description here
// You can write your code in this editor

//draw white backdrop
var bd_height = sprite_get_height(sprite_index)
var bd_width = sprite_get_width(sprite_index)
for(var i = -bd_width * 4; i <= room_width + bd_width * 4; i += bd_width)
{
	for(var j = -bd_height * 3; j <= room_height; j += bd_height)
	{
		draw_sprite(sprite_index,0,i,j);
	}
}