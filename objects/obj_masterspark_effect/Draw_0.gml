/// @description Insert description here
// You can write your code in this editor

var c_rainbow = make_color_hsv((global.time * 3) % 255,12,255);
var col = c_rainbow;

draw_sprite_ext(sprite_index,0,x,y,scale,scale,0,col,1);
