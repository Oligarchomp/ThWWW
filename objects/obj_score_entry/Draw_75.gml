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
	
			draw_text_color(x,y + i * 30,names[i],c_white,c_white,c_white,c_white,1 - !is_active * 0.6);
					
			draw_text_color(x + 132,y + i * 30,"/",c_white,c_white,c_white,c_white,1 - !is_active * 0.6);
					
			draw_score(scores[i],637,y + i * 30,spr_score,1,1 - !is_active * 0.6);
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
}