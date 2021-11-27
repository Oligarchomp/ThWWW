/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

var width = 960;
var height = 540;
draw_sprite_ext(sprite_index,0,width / 2,height / 2,scale,scale,0,c_white,1);

var x_off = sprite_get_width(sprite_index) * scale / 2;
var y_off = sprite_get_height(sprite_index) * scale / 2;
//top
draw_sprite_pos(spr_black,0,0,0,width,0,width,height / 2 - y_off,0,height / 2 - y_off,1);

//bottom
draw_sprite_pos(spr_black,0,0,height,width,height,width,height / 2 + y_off,0,height / 2 + y_off,1);

//left
draw_sprite_pos(spr_black,0,0,height,width / 2 - x_off,height,width / 2 - x_off,0,0,0,1);

//right
draw_sprite_pos(spr_black,height,width / 2 + x_off,height,width,height,width,0,width / 2 + x_off,0,1);