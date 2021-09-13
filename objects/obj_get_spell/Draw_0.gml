/// @description Insert description here
// You can write your code in this editor

col = make_color_hsv((step * 2) % 255,80,255);
draw_sprite_ext(sprite_index,0,x,y,x_scale,1,rot,col,1);


var width = sprite_get_width(spr_number);
var x_pos = x + string_length(bonus) * width / 2;

draw_score(bonus,x_pos,y + 20,spr_number,1,bonus_alpha);