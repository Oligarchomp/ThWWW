/// @description Insert description here
// You can write your code in this editor

for(var i = 0; i < 360; i += 360 / 3)
{
	draw_sprite_ext(sprite_index,image_index,x,y,1,1,rot + i,c_white,1);
}