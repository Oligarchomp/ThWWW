/// @description Insert description here
// You can write your code in this editor
if (!is_spawning)
{
	draw_sprite_ext(sprite_danmaku,image_danmaku,x,y,visual_xscale,visual_yscale,rot,c_white,alpha);
	
	if(global.view_hitbox)
	{
		draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,1)
	}
}