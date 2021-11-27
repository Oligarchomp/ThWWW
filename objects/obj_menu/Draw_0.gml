/// @description Insert description here
// You can write your code in this editor


draw_sprite(spr_main,level != 0,0,0);

draw_set_font(font_main);
switch(level)
{
	case 0://main menu
		for(var i = 0; i < array_length(menu); i += 1)
		{
			var is_active = (cursor[0] == i);
			menu[i].active_offset = goto_value(menu[i].active_offset,over_offset * is_active,6);
			
			draw_text_color(590 + menu[i].active_offset + i * 5,90 + i * 50,menu[i].title,c_white,c_white,c_white,c_white,1 - !is_active * 0.6);
		}
	break;
	case 1:
		switch(cursor[0])
		{
			case 0://difficulty
			case 2:
				for(var i = 0; i < 4; i += 1)
				{
					draw_sprite_ext(spr_difficulty,i,difficuly[i].x_is,difficuly[i].y_is,difficuly[i].scale,difficuly[i].scale,0,c_white,difficuly[i].alpha);
				}
			break;
			case 1:
				draw_sprite(spr_difficulty,4,difficuly[4].x_is,difficuly[4].y_is);
			break;
			case 3://spell practice stage
				var check = menu[cursor[0]].param;
				for(var i = 0; i < array_length(check); i += 1)
				{
					draw_text_color(620 + (cursor[level] == i) * 30,80 + i * 50,check[i].title,c_white,c_white,c_white,c_white,1);
				}
			break;
		}
	break;
	case 2:
		switch(cursor[0])//character
		{
			case 0:
			case 1:
			case 2:
				for(var i = 0; i < 3; i += 1)
				{
					switch(i)
					{
						case P_REIMU:
							var art = spr_reimu_art;
						break;
						case P_MARISA:
							var art = spr_marisa_art;
						break;
						case P_SANAE:
							var art = spr_sanae_art;
						break;
					}
					
					draw_sprite_ext(art,0,player[i].x_is,260,1,1,0,c_white,player[i].alpha);
				}
				
				var dif = cursor[0] != 1 ? global.difficulty : 4;
			
				draw_sprite_ext(spr_difficulty,dif,difficuly[dif].x_is,difficuly[dif].y_is,difficuly[dif].scale,difficuly[dif].scale,0,c_white,difficuly[dif].alpha);
			break;
			case 3://spell practice spell select
				var check = menu[cursor[0]].param[cursor[1]].param;
				
				draw_set_font(font_spellpractice);
				
				var max_spell = 20;
				
				var i_start = (cursor[level] >= max_spell) * max_spell;
				
				for(var i = i_start; i < min(max_spell + i_start,array_length(check)) ; i += 1)
				{
					var is_active = (cursor[level] == i);
					
					check[i].active_offset = goto_value(check[i].active_offset, is_active * 10,3);
					
					draw_text_color(490 + check[i].active_offset,60 + (i - i_start) * 20,check[i].title,c_white,c_white,c_white,c_white,1 - !is_active * 0.6);
				}
				
				if(array_length(check) > max_spell)
				{
					var y_sc = i_start == max_spell ? -1 : 1;
					
					draw_sprite_ext(spr_morespell,0,680,260 + y_sc * 220,1,y_sc,0,c_white,1);	
				}
			break;
		}
	break;
	case 3:
		switch(cursor[0])//stage select
		{
			case 2:
				var check = menu[cursor[0]].param[cursor[1]].param[cursor[2]].param;
				for(var i = 0; i < array_length(check); i += 1)
				{
					draw_text_color(620 + (cursor[level] == i) * 30,80 + i * 50,check[i].title,c_white,c_white,c_white,c_white,1);
				}
			break;
		}
	break;
}