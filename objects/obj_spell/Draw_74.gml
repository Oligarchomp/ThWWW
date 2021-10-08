/// @description Insert description here
// You can write your code in this editor

//I'm sorry for everything below
draw_set_font(font_spell);

var y_pos = y + 18;
var x_black = 0;
// draw life
if(!is_spell)
{
	if(life_uncover >  global.game_x_offset)// use to wait one frame, so the life can be set up by the child objec
	{
		repeat (3)
		{
			if(!non_only)
			{
				var change_bar_x =  life_bar_size * global.spell_life;
			}
			else
			{
				var change_bar_x =  0;
			}
		
			draw_line_width_color(x-1,y_pos,min(x + change_bar_x,life_uncover),y_pos,2,c_red,c_red);
			var true_bar_x = x + change_bar_x + (life_bar_size - change_bar_x) * (life_left / life)
			if(life_uncover > x + change_bar_x)
			{
				draw_line_width_color(x + change_bar_x,y_pos,min(true_bar_x,life_uncover),y_pos,2,c_white,c_white);
			}
		
			y_pos += 1;
		}
		var x_black = true_bar_x;
	}
	
}
else
{
	if(global.spell_life != 1)
	{
		life_uncover = 1000;
	}
	
	var x_pos = x + (life_bar_size * global.spell_life) * (life_left / life);
	
	repeat (3)
	{
		draw_line_width_color(x-1,y_pos,min(x_pos,life_uncover),y_pos,2,c_red,c_red);
	
		y_pos += 1;
	}
	var x_black = x_pos;
}

draw_line_width_color(x -1,y_pos,min(life_uncover,x_black),y_pos,1,c_black,c_black);

// draw time

var x_draw_time = x + 366;
var y_draw_time = 24
var time_draw = add_zero(floor(time_left / 60),2);
draw_score(time_draw,x_draw_time,y_draw_time,spr_number,1,spell_info_alpha)

var dec = floor((time_left % 60) * 100 / 60)
var str = add_zero(string(dec),2);
draw_score(str,x_draw_time + 20,y_draw_time + 8,spr_number,0.5,spell_info_alpha)


var col_out = c_black// $1c1c47;

// draw spell name
if (is_spell)
{
	//draw bonus
	if(is_capturing)
	{
		var text = add_zero(bonus,9);
	}
	else
	{
		var text = "Failed";
	}
	var x_pos = 440;
	var x_pos_score = x_pos - string_width(text);
	var y_pos = spell_info_y;
	draw_text_outline(x_pos - 110,y_pos,"Bonus:",text_col_top,text_col_top,text_col_bottom,text_col_bottom,spell_info_alpha,col_out);
	draw_text_outline(x_pos_score,y_pos,text,text_col_top,text_col_top,text_col_bottom,text_col_bottom,spell_info_alpha,col_out);

	draw_text_outline(x_pos + 5,y_pos,"| History:",text_col_top,text_col_top,text_col_bottom,text_col_bottom,spell_info_alpha,col_out);
	
	if(cap_history < 99)
	{
		var cap_hist = string(add_zero(cap_history,2));
		if(try_history < 99)
		{
			var try_hist = add_zero(try_history,2);
		}
		else
		{
			var try_hist = "99+";
		}
		draw_text_outline(x_pos + 70,y_pos,cap_hist + "/" ,text_col_top,text_col_top,text_col_bottom,text_col_bottom,spell_info_alpha,col_out);
		draw_text_outline(x_pos + 94,y_pos,try_hist,text_col_top,text_col_top,text_col_bottom,text_col_bottom,spell_info_alpha,col_out);
	}
	else
	{
		draw_text_outline(x_pos + 70,y_pos, "Master" ,text_col_top,text_col_top,text_col_bottom,text_col_bottom,spell_info_alpha,col_out);
		
	}
	

	

	//hey as long as it works
	draw_text_outline(x_pos - 100,y_pos - 17,"_____________________________",text_col_top,text_col_top,text_col_bottom,text_col_bottom,spell_info_alpha,col_out);

	
	
	var x_pos = x + text_x - string_width(spell_name);
	var y_pos = y + text_y;

	draw_text_outline(x_pos,y_pos,spell_name,text_col_top,text_col_top,text_col_bottom,text_col_bottom,text_alpha,col_out);
}


