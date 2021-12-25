/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index,0,x + global.game_x_offset,y + global.game_y_offset - 20,1,1,0,c_white,alpha);


draw_set_font(font_pause);

draw_text_outline(x + global.game_x_offset - 190,y + global.game_y_offset,"Life:",c_white,c_white,c_white,c_white,alpha,c_black);
draw_score(bonus_life,x + global.game_x_offset - 25,y + global.game_y_offset + 8,spr_number,1,alpha);
draw_text_outline(x + global.game_x_offset - 5,y + global.game_y_offset,"*",c_white,c_white,c_white,c_white,alpha,c_black);
draw_score(life_nbr,x + global.game_x_offset + 12,y + global.game_y_offset + 8,spr_number,1,alpha);
draw_text_outline(x + global.game_x_offset + 35,y + global.game_y_offset,"=",c_white,c_white,c_white,c_white,alpha,c_black);
var scr = life_nbr * bonus_life;
var off = string_length(string(scr)) * sprite_get_width(spr_number);
off -= scr == 0 ? 28 : 0;
draw_score(scr,x + global.game_x_offset + off + 75,y + global.game_y_offset + 8,spr_number,1,alpha);

var bomb_off = 40;
draw_text_outline(x + global.game_x_offset - 190,y + global.game_y_offset + bomb_off,"Bomb:",c_white,c_white,c_white,c_white,alpha,c_black);
draw_score(bonus_bomb,x + global.game_x_offset - 25,y + global.game_y_offset + 8 + bomb_off,spr_number,1,alpha);
draw_text_outline(x + global.game_x_offset - 5,y + global.game_y_offset + bomb_off,"*",c_white,c_white,c_white,c_white,alpha,c_black);
draw_score(bomb_nbr,x + global.game_x_offset + 12,y + global.game_y_offset + 8 + bomb_off,spr_number,1,alpha);
draw_text_outline(x + global.game_x_offset + 35,y + global.game_y_offset + bomb_off,"=",c_white,c_white,c_white,c_white,alpha,c_black);
var scr = bomb_nbr * bonus_bomb;
var off = string_length(string(scr)) * sprite_get_width(spr_number);
off -= scr == 0 ? 28 : 0;
draw_score(scr,x + global.game_x_offset + off + 75,y + global.game_y_offset + 8 + bomb_off,spr_number,1,alpha);