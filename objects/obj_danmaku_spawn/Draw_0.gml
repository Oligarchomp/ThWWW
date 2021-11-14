/// @description Insert description here

switch(spawn_type)
{
	case SPAWN_ALPHA:
		draw_sprite_ext(sprite_index,image_index,x,y,scale * image_xscale,scale * image_yscale,image_angle,c_color,alpha);
	break;
	case SPAWN_SCALE:
		draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,scale * image_yscale,image_angle,c_color,alpha);
	break;
}