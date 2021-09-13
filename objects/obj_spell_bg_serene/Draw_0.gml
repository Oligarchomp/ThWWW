/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


draw_sprite_ext(spr_spell_gradient,80,0,0,1,1,0,grad_color,grad_alpha)

for(var i = - width; i < room_width + width; i += width)
{
	for(var j = -height; j < room_height; j += height)
	{
		if((j / height) % 2 == 0)
		{
			draw_sprite_ext(spr_crab,0,x + i,y + j,1,1,0,color,alpha)
		}
		else
		{
			draw_sprite_ext(spr_crab,0,room_width - x - i,y + j ,1,1,0,color,alpha)
		}
	}
}