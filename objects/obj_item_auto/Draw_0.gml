/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index,image_index,x,y,1,1,angle,c_white,1);


if(y < 0)
{
	var high_max = -50;
	var high = max(y,high_max);
	
	draw_sprite_ext(spr_item_indicator,image_index,x, 4,1,1,0,c_white,high/high_max);
	
}