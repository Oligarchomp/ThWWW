/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index,0,x,y,scale,scale,0,col,alpha);

for(var i = 0 ; i < 360; i += 45)
{
	draw_sprite_ext(sprite_index,0,x + lengthdir_x(part_dist,i),y + lengthdir_y(part_dist,i),part_scale,part_scale,0,col,part_alpha);
}