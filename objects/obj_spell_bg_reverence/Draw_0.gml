/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

draw_sprite_ext(spr_bg_reverence,0,0,0,1,1,0,c_white,bg_alpha);

for(var l = 0; l < ds_list_size(x_list); l += 1)
{
	for(var i = - width; i < room_width + width; i += width)
	{
		for(var j = -height; j < room_height + height; j += height)
		{
			draw_sprite_ext(spr_grid_reverence,0,x_list[|l] + i,y_list[|l] + j,1,1,0,col_list[|l],alpha)
		}
	}
}