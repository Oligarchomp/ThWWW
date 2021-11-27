/// @description Insert description here
// You can write your code in this editor


//PAUSE

switch(pause_type)
{
	case PAUSE_MANUAL:
		var menu = pause;
	break;
	case PAUSE_END:
		var menu = done;
	break;
}

draw_set_font(font_pause);
if(pause_state >= 1)
{
	draw_sprite_pos(spr_black,0,0,0,960,0,960,540,0,540,pause_alpha / 1.7);
	
	for(var i = 0; i < array_length(menu); i += 1)
	{
		var is_active = (cursor[0] == i);
		menu[i].active_offset = goto_value(menu[i].active_offset,is_active * menu_offset,3)
		draw_text_outline(180 + text_offset + menu[i].active_offset,230 + i * 40,menu[i].title,c_white,c_white,c_white,c_white,pause_alpha * (1 - !is_active * 0.4 - (level != 0) * 0.4),c_black);
	}
	
	if(level == 1)
	{
		for(var i = 0; i < array_length(menu[cursor[0]].param); i += 1)
		{
			var is_active = (cursor[1] == i);
			menu[cursor[0]].param[i].active_offset = goto_value(menu[cursor[0]].param[i].active_offset,is_active * menu_offset,3);
			
			draw_text_outline(380,170,get_text("pause_sure"),c_white,c_white,c_white,c_white,1,c_black);
			draw_text_outline(380 + menu[cursor[0]].param[i].active_offset ,210 + i * 40,menu[cursor[0]].param[i].title,c_white,c_white,c_white,c_white,pause_alpha * (1 - !is_active * 0.5),c_black);	
		}
	}
}
