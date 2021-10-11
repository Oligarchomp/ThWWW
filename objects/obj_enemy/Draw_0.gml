/// @description Insert description here
// You can write your code in this editor

if(global.view_hitbox)
{
	draw_sprite(spr_fairy_hurtbox,0,x,y)
}

if(en_type == EN_FAMILIAR)
{
	draw_sprite_ext(sprite_index,image_index,x,y,spr_dir * 1.2 * scale,1.2 * scale,-rot,c_white,0.5 * alpha)
}

draw_sprite_ext(sprite_index,image_index,x,y,spr_dir * scale,scale,rot,c_white,alpha)