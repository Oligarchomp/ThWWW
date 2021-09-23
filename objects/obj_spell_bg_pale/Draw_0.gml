/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var alpha = hawaii_alpha * bg_alpha ;
for(var i = -width; i <= room_width; i += width)
{
	for(var j = -height; j <= room_height; j += height)
	{
		draw_sprite_ext(spr_hawaii,0,x + i,y + j,1,1,0,hawaii_color,alpha);
	}
}
var alpha = flower_alpha * bg_alpha ;
draw_sprite_ext(spr_flower,0,room_width/2,room_height / 2,1,1,flower_rot,flower_color,alpha);