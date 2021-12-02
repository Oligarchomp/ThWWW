/// @description Insert description here
// You can write your code in this editor

switch(level)
{
	case 0:
		var check = menu;
	break;
	case 1:
		var check = menu[cursor[0]].param;
	break;
	case 2:
		var check = menu[cursor[0]].param[cursor[1]].param;
	break;
	case 3:
		var check = menu[cursor[0]].param[cursor[1]].param[cursor[2]].param;
	break;
}
	
	
draw_sprite(spr_main,level != 0,0,0);

draw_set_font(font_main);
switch(level)
{
	case 0://main menu
		for(var i = 0; i < array_length(menu); i += 1)
		{
			var is_active = (cursor[0] == i);
			menu[i].active_offset = goto_value(menu[i].active_offset,over_offset * is_active,6);
			
			draw_text_color(590 + menu[i].active_offset + i * 5,70 + i * 48,menu[i].title,c_white,c_white,c_white,c_white,1 - !is_active * 0.6);
	
			if(is_active)
			{
				draw_set_font(font_spellpractice);
				draw_text_color(600 + menu[i].active_offset + i * 5,97 + i * 48,menu[i].description,c_white,c_white,c_white,c_white,menu_description_alpha);
				draw_set_font(font_main);
			}
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
				for(var i = 0; i < array_length(check); i += 1)
				{
					var is_active = (cursor[level] == i);
					
					check[i].active_offset = goto_value(check[i].active_offset,over_offset * is_active,6);
					
					draw_text_color(620 + check[i].active_offset,80 + i * 50,check[i].title,c_white,c_white,c_white,c_white,1 - !is_active * 0.6);
				}
			break;
			case 4://Score room
				
				var dif = ["e","n","h","l","ex"];
				var plr = ["r","m","s"];
				var index = dif[score_difficulty] + plr[global.player_chosen];
				
				switch(score_difficulty)
				{
					case 0:
						var txt = "Easy ";
					break;
					case 1:
						var txt = "Normal ";
					break;
					case 2:
						var txt = "Hard ";
					break;
					case 3:
						var txt = "Lunatic ";
					break;
					case 4:
						var txt = "Extra ";
					break;
				}
				
				switch(global.player_chosen)
				{
					case P_REIMU:
						var txt_plr = "Reimu";
					break;
					case P_MARISA:
						var txt_plr = "Marisa";
					break;
					case P_SANAE:
						var txt_plr = "Sanae";
					break;
				}
				draw_text_color(475 - string_width(txt),30,txt ,c_white,c_white,c_white,c_white,1);
				draw_text_color(475,30,"/ " + txt_plr,c_white,c_white,c_white,c_white,1);
				
				
				for(var i = 0; i < array_length(check) ; i += 1)
				{
					var score_name = variable_struct_get(check[i],index + "_name");
					
					draw_set_font(font_scorename);
					draw_text_color(332,88 + i * 40,score_name,c_white,c_white,c_white,c_white,1);
					
					draw_text_color(440,88 + i * 40,"/",c_white,c_white,c_white,c_white,1);
					
					draw_score(variable_struct_get(check[i],index),637,90 + i * 40,spr_score,1,1);
				}
			break;
			case 5: //replay
				draw_set_font(font_replay);
				
				draw_text(170,32,get_text("menu_look_replay"));
				var xx = 255;
				var yy = 70;
				var dist = 22;
				
				for(var i = 0; i < array_length(check); i += 1)
				{
					is_active = (cursor[level] == i)
					
					//relplay number
					draw_text_color(xx - 130,yy + i * dist,"ReplayN" + string(add_zero(i + 1,2)) + " //",c_white,c_white,c_white,c_white,1 - !is_active * 0.6 );
					//name
					draw_text_color(xx,yy + i * dist,check[i].nom,c_white,c_white,c_white,c_white,1 - !is_active * 0.6 );
					//date
					draw_text_color(xx + 80,yy + i * dist,"/ " + check[i].date,c_white,c_white,c_white,c_white,1 - !is_active * 0.6 );
					// hour
					draw_text_color(xx + 190,yy + i * dist,"/ " + check[i].hour ,c_white,c_white,c_white,c_white,1 - !is_active * 0.6 );
					// player
					draw_text_color(xx + 270,yy + i * dist,"/ " + check[i].player,c_white,c_white,c_white,c_white,1 - !is_active * 0.6 );
					// difficulty
					draw_text_color(xx + 360,yy + i * dist,"/ " + check[i].difficulty,c_white,c_white,c_white,c_white,1 - !is_active * 0.6 );
					// game_type
					draw_text_color(xx + 460,yy + i * dist,"/ " + check[i].game_type,c_white,c_white,c_white,c_white,1 - !is_active * 0.6 );
					
				}
			break;
			case 7://music room
				
				draw_set_font(font_spellpractice);
				for(var i = 0; i < array_length(check) ; i += 1)
				{
					var is_active = (cursor[level] == i);
					
					check[i].active_offset = goto_value(check[i].active_offset, is_active * 10,3);
					
					draw_text_color(580 + check[i].active_offset,50 + i * 20,check[i].title,c_white,c_white,c_white,c_white,1 - !is_active * 0.6);
				
					//spell comment
					if(is_active)
					{
						draw_text_color(100,410,get_text("music_comment"),c_white,c_white,c_white,c_white,menu_description_alpha);
						draw_text_color(100,426,"------------------------------------------------------",c_white,c_white,c_white,c_white,menu_description_alpha);
						draw_text_ext_color(100,448,check[i].comment,20,750,c_white,c_white,c_white,c_white,menu_description_alpha);
					}
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
				
				draw_set_font(font_spellpractice);
				
				var max_spell = 16;
				
				var i_start = (cursor[level] >= max_spell) * max_spell;
				
				for(var i = i_start; i < min(max_spell + i_start,array_length(check)) ; i += 1)
				{
					var is_active = (cursor[level] == i);
					
					check[i].active_offset = goto_value(check[i].active_offset, is_active * 10,3);
					
					draw_text_color(210 + check[i].active_offset,60 + (i - i_start) * 20,check[i].title,c_white,c_white,c_white,c_white,1 - !is_active * 0.6);
					
					//attempts
					switch(check[i].diff)
					{
						case 0:
							var diff_letter = "E";
						break;
						case 1:
							var diff_letter = cursor[1] != 6 ? "N" : "Ex";
						break;
						case 2:
							var diff_letter = "H";
						break;
						case 3:
							var diff_letter = "L";
						break;
					}
					
					draw_text_color(660 + check[i].active_offset,60 + (i - i_start) * 20,diff_letter,c_white,c_white,c_white,c_white,1 - !is_active * 0.6);
					
					//ignore this error
					var str = "Game: " + string(min(999,add_zero(check[i].cap_game,3))) + " / " + string(min(999,add_zero(check[i].try_game,3))) + "  Prac.:" + string(min(999,add_zero(check[i].cap_prac,3))) + " / " + string(min(999,add_zero(check[i].try_prac,3)))
					draw_text_color(680 + check[i].active_offset,60 + (i - i_start) * 20,str,c_white,c_white,c_white,c_white,1 - !is_active * 0.6);
				
					//spell comment
					if(is_active)
					{
						draw_text_color(100,410,get_text("spell_comment"),c_white,c_white,c_white,c_white,menu_description_alpha);
						draw_text_color(100,426,"------------------------------------------------------",c_white,c_white,c_white,c_white,menu_description_alpha);
						draw_text_ext_color(100,448,check[i].comment,20,750,c_white,c_white,c_white,c_white,menu_description_alpha);
					}
				
				}
				
				//little arrow when 2 pages
				if(array_length(check) > max_spell)
				{
					var y_sc = i_start == max_spell ? -1 : 1;
					
					draw_sprite_ext(spr_morespell,0,580,220 + y_sc * 180,1,y_sc,0,c_white,1);	
				}
				
			break;
		}
	break;
	case 3:
		switch(cursor[0])//stage select
		{
			case 2:
				for(var i = 0; i < array_length(check); i += 1)
				{
					var is_active = (cursor[level] == i);
					
					check[i].active_offset = goto_value(check[i].active_offset,over_offset * is_active,6);
					
					draw_text_color(620 + check[i].active_offset,80 + i * 50,check[i].title,c_white,c_white,c_white,c_white,1 - !is_active * 0.6);
				}
			break;
		}
	break;
}