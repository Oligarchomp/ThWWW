/// @description Insert description here
// You can write your code in this editor
/*
draw_set_font(font_spell);


var y_pos = 20;
// draw life
if(!is_spell)
{
	repeat (3)
	{
		var change_bar_x = room_width * global.spell_life;
		draw_line_color(-1,y_pos,change_bar_x,y_pos,c_red,c_red);
	
		var true_bar_x = change_bar_x + (room_width - change_bar_x) * (life_left / life)
		draw_line_color(change_bar_x,y_pos,true_bar_x,y_pos,c_white,c_white);
		y_pos += 1;
	}
	var x_black = true_bar_x;
	
}
else
{
	repeat (3)
	{
		var x_pos = (room_width * global.spell_life) * (life_left / life);
		draw_line_color(-1,y_pos,x_pos,y_pos,c_red,c_red);
	
		y_pos += 1;
	}
	var x_black = x_pos;
}

draw_line_color(-1,y_pos,x_black,y_pos,c_black,c_black);

// draw time
draw_text(360,30,floor(time_left / 60) + 1)


// draw spell name
//   :/ i know shaders exists but shut up

if (is_spell)
{
	var col = $2a2a74;
	draw_text_color(text_x - string_width(spell_name) ,text_y - 1,spell_name,col,col,col,col,text_alpha);
	draw_text_color(text_x - string_width(spell_name) ,text_y + 1,spell_name,col,col,col,col,text_alpha);
	draw_text_color(text_x - string_width(spell_name) + 1,text_y ,spell_name,col,col,col,col,text_alpha);
	draw_text_color(text_x - string_width(spell_name) - 1,text_y ,spell_name,col,col,col,col,text_alpha);

	draw_text_color(text_x - string_width(spell_name),text_y,spell_name,text_col_top,text_col_top,text_col_bottom,text_col_bottom,text_alpha);
}