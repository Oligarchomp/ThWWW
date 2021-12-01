/// @description Insert description here
// You can write your code in this editor

draw_sprite(spr_main,1,0,0);

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
		draw_set_font(font_pause)
		
		draw_text_color(280,180,get_text("score_replay"),c_white,c_white,c_white,c_white,menu_alpha);
		draw_text_color(280,190,"____________________________________",c_white,c_white,c_white,c_white,menu_alpha);
		
		for (var i = 0; i < array_length(menu); i += 1)
		{
			var is_active = cursor == i;
			
			draw_text_color(460,250 + i * 60,menu[i].title,c_white,c_white,c_white,c_white,menu_alpha * (1 - !is_active * 0.7));
		}
	break;
}