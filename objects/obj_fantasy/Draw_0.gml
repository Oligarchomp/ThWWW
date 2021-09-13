/// @description Insert description here
// You can write your code in this editor

col = make_color_hsv((step + col_dif) % 255,80,255);
draw_sprite_ext(sprite_index,0,x,y,scale,scale,0,col,alpha);
var scale2 = base_scale - (scale - base_scale)
draw_sprite_ext(sprite_index,0,x,y,scale2,scale2,0,col,alpha);