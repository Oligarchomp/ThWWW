/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


for (var j = 0; j < 2; j += 1)
{
	for(var i = 0; i < array_length(y_pos); i += 1)
	{
		draw_sprite_ext(spr_yuuto_star,0,x,y_pos[i] - j * height * scale_list[i],scale_list[i],scale_list[i],0,c_white,0.5);
		
	}
	
}
