/// @description Insert description here
// You can write your code in this editor

// focus effect
draw_sprite_ext(spr_focus,0,x,y,focus_scale,focus_scale,focus_angle,c_white,focus_alpha)
draw_sprite_ext(spr_focus,0,x,y,focus_scale,focus_scale,-focus_angle + 45,c_white,focus_alpha)

//player
draw_sprite_ext(sprite_index,image_index,x,y,scale,scale,0,c_white,alpha);

//Hitbox
draw_sprite_ext(spr_player_hitbox_visual,0,hitbox_x,hitbox_y,hitbox_scale,hitbox_scale,0,c_white,hitbox_alpha)

//invincibility circle
var inv_scale = invincibility / 200;
draw_sprite_ext(spr_boss_indicator,0,x,y,inv_scale,inv_scale,state_time,c_white,0.3);
