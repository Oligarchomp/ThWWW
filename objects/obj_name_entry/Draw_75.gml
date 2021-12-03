/// @description Insert description here
// You can write your code in this editor

var char_dist = 25;


if(instance_exists(obj_replay))
{
	var x1 = x - 20;
	var y1 = y - 20;
	var width = 365;
	var height = 185;
	if(!instance_exists(obj_gameplay))
	{
		draw_sprite_part(spr_main,1,x1,y1,width,height,x1,y1);
	}
	else
	{
		draw_sprite_pos(spr_black,0,x1,y1,x1 + width,y1,x1 + width,y1 + height,x1,y1 + height,1)
	}
	var wid = 4;
	draw_line_width(x1,y1,x1 + width,y1,wid);
	draw_line_width(x1 + width,y1,x1 + width,y1 + height,wid);
	draw_line_width(x1,y1 + height,x1 + width,y1 + height,wid);
	draw_line_width(x1,y1,x1,y1 + height,wid);
}


for(var i = 0; i < array_length(character); i += 1)
{
	draw_set_font(font_scorename);
	
	var x_pos = x + i % panel_width * char_dist;
	var y_pos = y + (i - i % panel_width) / panel_width * char_dist;
	var is_active = cursor == i;
	
	switch(character[i])
	{
		case "ENTER":
			draw_sprite_ext(spr_keyboard,0,x_pos,y_pos,1,1,0,c_white,1 - !is_active * 0.7);
		break;
		case "BACK":
			draw_sprite_ext(spr_keyboard,1,x_pos,y_pos,1,1,0,c_white,1 - !is_active * 0.7);
		break;
		default:
			draw_text_color(x_pos,y_pos,character[i],c_white,c_white,c_white,c_white,1 - !is_active * 0.7)	
		break;
	}
}