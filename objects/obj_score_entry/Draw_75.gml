//
//

if(room == room_gp)
{
	draw_sprite_pos(spr_black,0,0,0,960,0,960,540,0,540,alpha_score);
}

switch(state)
{
	case 0:
		for(var i = 0; i < array_length(scores); i += 1)
		{
			var is_active = i == score_pos;
	
			draw_set_font(font_scorename);
	
			draw_text_color(x +	15,y + i * 30,names[i],c_white,c_white,c_white,c_white,1 - !is_active * 0.6);
				
			draw_text_color(x + 147,y + i * 30,"/",c_white,c_white,c_white,c_white,1 - !is_active * 0.6);
					
			draw_score(scores[i],623,y + i * 30,spr_score,1,1 - !is_active * 0.6);
		}
	break;
	case 1:
		if(!instance_exists(obj_replay))
		{
			draw_set_font(font_pause)
		
			var txt = get_text("score_replay");
			draw_text_color(480 - string_width(txt) / 2,180,txt,c_white,c_white,c_white,c_white,menu_alpha);
			var txt = "_______________________________"
			draw_text_color(480 - string_width(txt) / 2 ,190,txt,c_white,c_white,c_white,c_white,menu_alpha);
		
			for (var i = 0; i < array_length(menu); i += 1)
			{
				var is_active = cursor == i;
			
				draw_text_color(480 - string_width(menu[i].title) / 2,250 + i * 60,menu[i].title,c_white,c_white,c_white,c_white,menu_alpha * (1 - !is_active * 0.7));
			}
		}
	break;
	case 2:
	case 3:
		draw_set_font(font_pause)
	
		var txt = get_text("score_no_replay");
		draw_text_color(480 - string_width(txt) / 2,250,txt,c_white,c_white,c_white,c_white,menu_alpha);
	break;
	case 4: //results
		draw_set_font(font_main);
		var x_ref = 480;
		var x_ref2 = 570
		var y_ref = 200;
		var y_dist = 40;
		var w = c_white;
		
		var text = get_text("result_result")
		draw_text_color(x_ref - string_width(text) / 2,90,text,w,w,w,w,result_alpha);
		
		var text = "________________________"
		draw_text_color(x_ref - string_width(text) / 2,110,text,w,w,w,w,result_alpha);
		
		
		switch(global.player_chosen)
		{
			case P_REIMU:
				var text = "REIMU";
			break;
			case P_MARISA:
				var text = "MARISA";
			break;
			case P_SANAE:
				var text = "SANAE";
			break;
		}
		
		draw_text_color(x_ref - string_width(text) / 2,160,text,w,w,w,w,result_alpha);
		
		
		var text = get_text("result_score")
		draw_text_color(x_ref - string_width(text),y_ref,text,w,w,w,w,result_alpha);
		
		var text = add_zero(string(global.score),global.score_lenght);
		draw_text_color(x_ref2 - string_width(text) / 2,y_ref,text,w,w,w,w,result_alpha);
		
		
		var text = get_text("result_diff")
		draw_text_color(x_ref - string_width(text),y_ref + y_dist,text,w,w,w,w,result_alpha);
		
		
		switch(global.difficulty)
		{
			case 0:
				var text = "EASY";
			break;
			case 1:
				var text = "NORMAL";
			break;
			case 2:
				var text = "HARD";
			break;
			case 3:
				var text = "LUNATIC";
			break;
		}
		draw_text_color(x_ref2 - string_width(text) / 2,y_ref + y_dist,text,w,w,w,w,result_alpha);
		
		
		
		
		var text = get_text("result_continue")
		draw_text_color(x_ref - string_width(text),y_ref + y_dist * 2,text,w,w,w,w,result_alpha);
	
		var text = string(global.continues_max - global.continues);
		draw_text_color(x_ref2 - string_width(text) / 2,y_ref + y_dist * 2,text,w,w,w,w,result_alpha);
		
	
	
		var text = get_text("result_miss")
		draw_text_color(x_ref - string_width(text),y_ref + y_dist * 3,text,w,w,w,w,result_alpha);

		var text = string(global.miss);
		draw_text_color(x_ref2 - string_width(text) / 2,y_ref + y_dist * 3,text,w,w,w,w,result_alpha);



		var text = get_text("result_bomb")
		draw_text_color(x_ref - string_width(text),y_ref + y_dist * 4,text,w,w,w,w,result_alpha);

		var text = string(global.bomb_used);
		draw_text_color(x_ref2 - string_width(text) / 2,y_ref + y_dist * 4,text,w,w,w,w,result_alpha);



		var text = get_text("result_spell")
		draw_text_color(x_ref - string_width(text),y_ref + y_dist * 5,text,w,w,w,w,result_alpha);

		var text = string(global.spell_captured);
		draw_text_color(x_ref2 - string_width(text) / 2,y_ref + y_dist * 5,text,w,w,w,w,result_alpha);
	break;
}