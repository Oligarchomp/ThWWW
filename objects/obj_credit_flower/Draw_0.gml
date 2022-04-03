/// @description Insert description here
// You can write your code in this editor

for(var i = -width * 3; i < room_width; i += width)
{
	for (var j = -height; j < room_height; j += height )
	{
		draw_sprite_ext(spr_credit_flower,0,x + i, y + j,1,1,0,c_white,alpha_flower);
		draw_sprite_ext(spr_credit_flower,0,room_width - x - i, y + j,1,1,0,c_white,alpha_flower);	
		
	}
	
}
