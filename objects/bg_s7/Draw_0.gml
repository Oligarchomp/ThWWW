/// @description Insert description here
// You can write your code in this editor
gpu_set_ztestenable(true);

for(var i = -height * 6; i < room_width; i += height)
{
	// draw roof vertex
	var tex = sprite_get_texture(spr_roof,0);
	vertex_submit(roof_buff,pr_trianglelist,tex);
	
	draw_sprite(sprite_index,0,x,y + i);
	
}

gpu_set_ztestenable(false);