/// @description Insert description here
// You can write your code in this editor
if (!is_spawning)
{
	draw_sprite_ext(sprite_danmaku,image_danmaku,x,y,image_xscale,image_yscale,rot,c_white,alpha);
	
	event_inherited();//draw hitbox when debug
}