/// @description Insert description here
// You can write your code in this editor

draw_sprite(spr_main,1,0,0);

draw_set_font(global.font_main_j);

for(var i = 0; i < array_length(menu); i += 1)
{
	var text = menu[i].title;
	draw_text_color(room_width / 2 - string_width(text) / 2,210 + i * 70,text,c_white,c_white,c_white,c_white,0.5 + (i == cursor) * 0.5)
}

var alp = 0.6;
var x_ref = 30;
draw_set_font(font_dialogue);

draw_text_color(x_ref,20, "Default        Key       Xbox",c_white,c_white,c_white,c_white,alp);

for(var i = 0; i < 4; i += 1)
{
	draw_text_color(x_ref,50 + i * 30, cont[i],c_white,c_white,c_white,c_white,alp);
	draw_text_color(x_ref + 120,50 + i * 30, cont_key[i],c_white,c_white,c_white,c_white,alp);
	draw_text_color(x_ref + 210,50 + i * 30, cont_xbox[i],c_white,c_white,c_white,c_white,alp);
}
