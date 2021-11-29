/// @description Insert description here
// You can write your code in this editor

if(instance_exists(obj_player))
{
	var p = obj_player;
	draw_sprite_ext(spr_player_hitbox_visual,0,p.hitbox_x,p.hitbox_y,p.hitbox_scale,p.hitbox_scale,p.hitbox_rot,c_white,p.hitbox_alpha * p.alpha)
}

if (global.view_hitbox)
{
	draw_sprite(sprite_index,image_index,x,y)
}
