/// @description Insert description here
// You can write your code in this editor

draw_sprite(spr_main,1,0,0);

draw_set_font(font_main_j);

for(var i = 0; i < array_length(menu); i += 1)
{
	var text = menu[i].title;
	draw_text_color(room_width / 2 - string_width(text) / 2,200 + i * 70,text,c_white,c_white,c_white,c_white,0.5 + (i == cursor) * 0.5)
		
	
	
}

