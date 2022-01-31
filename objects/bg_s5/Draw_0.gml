/// @description Insert description here
// You can write your code in this editor

gpu_set_ztestenable(true);
for(var i = - 500; i < 400; i += height)
{
	draw_sprite_ext(sprite_index,0,x,y + i,1,1,0,c_white,1);
}



// draw wall vertex
var tex = sprite_get_texture(spr_boat_wall,0);
vertex_submit(wall_buff,pr_trianglelist,tex);

//draw beam vertex
var tex = sprite_get_texture(spr_boat_beam,0);
vertex_submit(beam_buff,pr_trianglelist,tex);


//draw dark vertex
var tex = sprite_get_texture(spr_boat_dark,0);
vertex_submit(dark_buff,pr_trianglelist,tex);

gpu_set_ztestenable(false);

