/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index,0,x + global.game_x_offset,y + global.game_y_offset,1,1,0,c_white,alpha);

var len = string_length(string(bonus))
var off = len * sprite_get_width(spr_number) / 2 - 13 + floor((len - 1) / 3) * 6;
draw_score(bonus,x + global.game_x_offset + off ,y + global.game_y_offset + 30,spr_number,1,alpha);
