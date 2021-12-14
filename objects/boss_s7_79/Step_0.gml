/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	obj_boss.sprite_index = spr_reverence_rest_end;
	rest_image = goto_value(rest_image,obj_boss.image_number - 1, 0.1);
	obj_boss.image_index = rest_image;
	
	
}
// Inherit the parent event
event_inherited();

