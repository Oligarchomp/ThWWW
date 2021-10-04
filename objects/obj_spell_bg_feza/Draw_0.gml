/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


for(var i = -width; i < room_width; i += width)
{
	for(var j = -height; j < room_height; j += height)
	{
		draw_sprite_ext(spr_feza_grid,0,x + i, y + j,1,1,0,grid_col,bg_alpha);
		draw_sprite_ext(spr_feza_grid,0,room_width - x - i, y + j,1,1,0,grid_col,bg_alpha);
	}
}

draw_sprite_ext(spr_feza_world,1,0,0,1,1,0,world_col2,bg_alpha);
draw_sprite_ext(spr_feza_world,0,0,0,1,1,0,world_col,bg_alpha);