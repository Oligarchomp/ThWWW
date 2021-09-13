/// @description Insert description here
// You can write your code in this editor

//draw the girls
draw_sprite_ext(plr_spr,plr_im,x_plr,y_plr,1,1,0,c_white,plr_alpha);
draw_sprite_ext(boss_spr,boss_im,x_boss,y_boss,1,1,0,c_white,boss_alpha);

//draw the dialogue box
draw_sprite_ext(spr_dialoguebox,0,x_diag,y_diag,1,1,0,c_white,diag_alpha);

//draw the stupid things they say

draw_set_font(font_dialogue);
var text = text_list[|current_nbr];
var text_x = x_diag - 175;
var text_y = y_diag - 46;
var text_lenght = 350;
var text_height = string_height(text) * 1;
draw_text_ext_color(text_x,text_y,text,text_height ,text_lenght,c_white,c_white,c_white,c_white,text_alpha)