/// @description Insert description here
// You can write your code in this editor

//bg
draw_sprite_ext(spr_ending_bg,0,room_width / 2, 200,1,1,0,c_white,alpha_bg);

//image
draw_sprite_ext(spr_endings,image_is,room_width / 2,200,1,1,0,c_white,alpha);

draw_set_font(font_dialogue);


var x_ref = 105;
var y_ref = 480;

for(var i = 0; i < 4; i += 1)
{
	draw_text_color(x_ref,y_ref - text_y_dist * 3 + text_y_dist * i,line_list[|i],color_list[|i],color_list[|i],color_list[|i],color_list[|i],1);
}
//hide text
draw_sprite_pos(spr_black,0,0,y_ref + text_y_dist - text_hide_plus,room_width,y_ref + text_y_dist - text_hide_plus,room_width,room_height,0,room_height,1);

//fade out
draw_sprite_pos(spr_black,0,0,0,960,0,960,540,0,540,black_alpha);