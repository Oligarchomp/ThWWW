/// @description Insert description here
// You can write your code in this editor

for(var i = -2; i < 6; i += 1)
{
	draw_sprite(sprite_index,0,x,y + height * i);
	draw_sprite(spr_grass,0,x + width,y + height * i);
	draw_sprite(spr_grass,0,x - width,y + height * i);
	
}