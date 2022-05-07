/// @description Insert description here
// You can write your code in this editor

//draw white outline player

var alpha_pow = 8; 

var xx = x_plr - sprite_get_xoffset(plr_spr);
var yy = y_plr - sprite_get_yoffset(plr_spr);

var size = global.game_x_offset - xx;

shader_set(shad_white);
draw_sprite_part_ext(plr_spr,plr_im,0,0,size,sprite_get_height(plr_spr),xx - 1,yy,1,1,c_white,power(plr_alpha,alpha_pow));
draw_sprite_part_ext(plr_spr,plr_im,0,0,size,sprite_get_height(plr_spr),xx + 1,yy,1,1,c_white,power(plr_alpha,alpha_pow));
draw_sprite_part_ext(plr_spr,plr_im,0,0,size,sprite_get_height(plr_spr),xx,yy - 1,1,1,c_white,power(plr_alpha,alpha_pow));
draw_sprite_part_ext(plr_spr,plr_im,0,0,size,sprite_get_height(plr_spr),xx,yy + 1,1,1,c_white,power(plr_alpha,alpha_pow));
shader_reset();


//draw white outline boss
var xx = x_boss - sprite_get_xoffset(boss_spr);
var yy = y_boss - sprite_get_yoffset(boss_spr);

var x_w = sprite_get_width(boss_spr);
var size = x_w - (global.game_x_offset + room_width - xx);

var sprite_dist = x_w - size;
shader_set(shad_white);
draw_sprite_part_ext(boss_spr,boss_im,sprite_dist,0,size,sprite_get_height(boss_spr),sprite_dist + xx - 1,yy,1,1,c_white,power(boss_alpha,alpha_pow));
draw_sprite_part_ext(boss_spr,boss_im,sprite_dist,0,size,sprite_get_height(boss_spr),sprite_dist + xx + 1,yy,1,1,c_white,power(boss_alpha,alpha_pow));
draw_sprite_part_ext(boss_spr,boss_im,sprite_dist,0,size,sprite_get_height(boss_spr),sprite_dist + xx,yy - 1,1,1,c_white,power(boss_alpha,alpha_pow));
draw_sprite_part_ext(boss_spr,boss_im,sprite_dist,0,size,sprite_get_height(boss_spr),sprite_dist + xx,yy + 1,1,1,c_white,power(boss_alpha,alpha_pow));
shader_reset();


//draw the girls
var col = make_color_hsv(0,0,0 + plr_alpha * 255);
draw_sprite_ext(plr_spr,plr_im,x_plr,y_plr,1,1,0,col,art_alpha_plr);

var col = make_color_hsv(0,0,0 + boss_alpha * 255);
draw_sprite_ext(boss_spr,boss_im,x_boss,y_boss,1,1,0,col,art_alpha_boss);


//draw the dialogue box
draw_sprite_ext(spr_dialoguebox,0,x_diag,y_diag,1,1,0,c_white,diag_alpha);

//draw the stupid things they say

set_font(FONT_DIALOGUE);

var text = text_list[current_nbr];
var text_x = x_diag - 175 - 8 * (global.lan == LAN_JAP);
var text_y = y_diag - 48 + 4 * (global.lan == LAN_JAP);
var text_lenght = 350;
var text_height = 32;
draw_text_ext_color(text_x,text_y,text,text_height,text_lenght,c_white,c_white,c_white,c_white,text_alpha * text_alpha_diag)