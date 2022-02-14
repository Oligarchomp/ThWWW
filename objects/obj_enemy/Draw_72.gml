/// @description Insert description here
// You can write your code in this editor
switch(en_type)
{
	//case EN_CRAB:
		//nothing
	//break;
	case EN_FAMILIAR:
		draw_sprite_ext(sprite_index,image_index,x,y,spr_dir * 1.2 * scale,1.2 * scale,-rot,c_white,0.5 * alpha)
	break;
	default:
		draw_sprite_ext(spr_fairy_indicator,0,x,y,1,1,step * 4,c_white,0.4);
	break;
}