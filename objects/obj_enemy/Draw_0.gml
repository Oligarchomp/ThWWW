/// @description Insert description here
// You can write your code in this editor

if(global.view_hitbox)
{
	draw_sprite(spr_fairy_hurtbox,0,x,y)
}

switch(en_type)
{
	case EN_FAMILIAR:
		draw_sprite_ext(sprite_index,image_index,x,y,spr_dir * 1.2 * scale,1.2 * scale,-rot,c_white,0.5 * alpha)
	break;
	default:
		draw_sprite_ext(spr_fairy_indicator,0,x,y,1,1,step * 4,c_white,0.4);
	break;
}

draw_sprite_ext(sprite_index,image_index,x,y,spr_dir * scale,scale,rot,c_white,alpha)