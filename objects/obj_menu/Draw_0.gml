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
var draw_replay = false;
var draw_player = false;
var draw_stage_practice = false;

draw_sprite(spr_main,level != 0,0,0);

draw_set_font(font_main);
switch(level)
{
	case 0://main menu
		for(var i = 0; i < array_length(menu); i += 1)
		{
			var is_active = (cursor[0] == i);
			menu[i].active_offset = goto_value(menu[i].active_offset,over_offset * is_active,6);
			
			var col = menu[i].action != MENU_INVALID ? c_white : $5a5a5a;
			
			draw_text_color(530 + menu[i].active_offset + i * 4,145 + i * 30,menu[i].title,col,col,col,col,1 - !is_active * 0.6);
	
			if(is_active)
			{
				set_font(FONT_SPELLPRACTICE);
				
				draw_text_outline(580 + menu[i].active_offset - string_width(menu[i].description) / 2,480,menu[i].description,c_white,c_white,c_white,c_white,menu_description_alpha,c_black);
				draw_set_font(font_main);
			}
		}
	break;
	case 1:
		
		var spr = global.lan == LAN_ENG ? spr_difficulty : spr_difficulty_j;
		
		switch(cursor[0])
		{
			case 0://difficulty
			case 2:
				for(var i = 0; i < 4; i += 1)
				{
					var is_active = i == global.difficulty;
					draw_sprite_ext(spr,i,difficuly[i].x_is,difficuly[i].y_is,1,1,0,c_white,1 - !is_active * 0.7);
				}
			break;
			case 1:
				draw_sprite(spr,4,difficuly[4].x_is,difficuly[4].y_is);
			break;
			case 3://spell practice stage
				
				var xx = 520 - 20;
				var yy = 120 - 20;
				var width = 236;
				var height = 310;
				var wid = 4;
	
				draw_line_width(xx,yy,xx + width,yy,wid);
				draw_line_width(xx + width,yy,xx + width,yy + height,wid);
				draw_line_width(xx,yy + height,xx + width,yy + height,wid);
				draw_line_width(xx,yy,xx,yy + height,wid);
				
				for(var i = 0; i < array_length(check); i += 1)
				{
					var is_active = (cursor[level] == i);
					
					var col = check[i].action != MENU_INVALID ? c_white : $5a5a5a;
					
					check[i].active_offset = goto_value(check[i].active_offset,20 * is_active,6);
					
					draw_text_color(520 + check[i].active_offset,120 + i * 40,check[i].title,col,col,col,col,1 - !is_active * 0.6);
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
				draw_text_color(470 - string_width(txt),30,txt ,c_white,c_white,c_white,c_white,1);
				draw_text_color(470,30,"/ " + txt_plr,c_white,c_white,c_white,c_white,1);
				
				
				for(var i = 0; i < array_length(check) ; i += 1)
				{
					var score_name = variable_struct_get(check[i],index + "_name");
					
					draw_set_font(font_scorename);
					draw_text_color(322,88 + i * 40,score_name,c_white,c_white,c_white,c_white,1);
					
					draw_text_color(442,88 + i * 40,"/",c_white,c_white,c_white,c_white,1);
					
					draw_score(variable_struct_get(check[i],index),615,90 + i * 40,spr_score,1,1);
				}
			break;
			case 5: //replay
				draw_replay = true;
			break;
			case 6: // options
				var xx = 460; 
				var yy = 110
				var xx2 = xx + 50;
				
				draw_set_valign(fa_middle);
				
				set_font(FONT_MAIN);
				
				for(var i = 0; i < array_length(check); i += 1)
				{
					var is_active = (cursor[level] == i);
					
					var txt = check[i].title;
					
					var off = 0;
					if((i == array_length(check) - 1) and (!rng_unlock)) or (i == array_length(check) - 3)
					{
						off = string_width(txt) / 2 + (xx2 - xx) / 2;
					}
					
					draw_text_color(xx - string_width(txt) + off,yy + i * 60,txt,c_white,c_white,c_white,c_white,1 - !is_active * 0.7);
				
					switch(i)
					{
						case 0:
							var fs = data_read("Data.ini","option","fullscreen");
							txt = fs ? "ON" : "OFF";
							
							draw_text_color(xx2,yy,txt,c_white,c_white,c_white,c_white,1);
						break;
						case 1:
							var x1 = xx2;
							var x2 = x1 + 200;
							var y1 = yy + i * 60;
							draw_line_width_color(x1,y1,x2,y1,4,c_white,c_white);
							
							var xc = x1 + (x2 - x1) / 9 * (data_read("Data.ini","option","sfx") - 1);
							draw_line_width_color(xc,y1 - 10,xc,y1 + 10,4,c_white,c_white);
							
						break;
						case 2:
							var x1 = xx2;
							var x2 = x1 + 200;
							var y1 = yy + i * 60;
							draw_line_width_color(x1,y1,x2,y1,4,c_white,c_white);
							
							var xc = x1 + (x2 - x1) / 9 * (data_read("Data.ini","option","bgm") - 1);
							draw_line_width_color(xc,y1 - 10,xc,y1 + 10,4,c_white,c_white);
							
						break;
						case 4:	//language
							txt = get_text("menu_language2")
							draw_text_color(xx2,yy + i * 60,txt,c_white,c_white,c_white,c_white,1);
						break;
						case 5:
							if(rng_unlock)
							{
								var fs = data_read("Data.ini","option","rng");
								txt = fs ? "ON" : "OFF";
							
								draw_text_color(xx2,yy + i * 60,txt,c_white,c_white,c_white,c_white,1);
							}
						break;
						
					}
				}
				
				draw_set_valign(fa_top);
			break;
			case 7://music room
				
				var y_minus = 170;
				/*
				if(rng_unlock)
				{
					draw_sprite(spr_rev_music,step / 40,300,220)
					var y_minus = 0;
				}
				*/
				
				for(var i = 0; i < array_length(check) ; i += 1)
				{
					var is_active = (cursor[level] == i);
					
					check[i].active_offset = goto_value(check[i].active_offset, is_active * 10,3);
					
					draw_set_font(font_spellpractice);
					
					draw_text_color(510 + check[i].active_offset,90 + i * 20,check[i].title,c_white,c_white,c_white,c_white,1 - !is_active * 0.6);
					
					switch(global.lan)
					{
						case LAN_ENG:
							draw_set_font(font_spellpractice);
							var dot = "------------------------------------------------------";
						break;
						case LAN_JAP:
							draw_set_font(global.font_spellpractice_j);
							var dot = "--------------------------------------";
						break;
					}
					
					//spell comment
					if(is_active)
					{
						draw_text_color(160,410 - y_minus,get_text("music_comment"),c_white,c_white,c_white,c_white,menu_description_alpha);
						draw_text_color(160,426 - y_minus,dot,c_white,c_white,c_white,c_white,menu_description_alpha);
						draw_text_ext_color(160,448 - y_minus,check[i].comment,20,750,c_white,c_white,c_white,c_white,menu_description_alpha);
					}
				}
				
				
			break;
			case 8://manual
			
				set_font(FONT_MAIN);
				
				for(var i = 0; i < array_length(check); i += 1)
				{
					var is_active = (cursor[level] == i);
					draw_text_color(80,90 + i * 40,check[i].title,c_white,c_white,c_white,c_white,1 - !is_active * 0.7)
				}
				
				draw_sprite_ext(spr_manual,cursor[level],300,0,1,1,0,c_white,menu_description_alpha)
			break;
			case 9://credit
				draw_sprite(spr_credit,0,room_width / 2,50);
				//draw_sprite(spr_pale_credit,step / 40,170,340);
			break;
		}
	break;
	case 2:
		switch(cursor[0])//character
		{
			case 0:
			case 1:
			case 2:
				draw_player = true;
			break;
			case 3://spell practice player
			
				switch(global.player_chosen)
				{
					case P_REIMU:
						var txt = global.lan == LAN_ENG ? "Reimu" : "霊夢";
					break;
					case P_MARISA:
						var txt = global.lan == LAN_ENG ? "Marisa" : "魔理沙";
					break;
					case P_SANAE:
						var txt = global.lan == LAN_ENG ? "Sanae" : "早苗";
					break;
				}
				
				var xx = 310 + player[global.player_chosen].x_is / 2;
				var yy = 20;
				
				set_font(FONT_MAIN);
				
				draw_text(xx - string_width(txt) / 2,yy,txt);
				//spell practice spell select
				
				var max_spell = 16;
				
				var i_start = (cursor[level] >= max_spell) * max_spell;
				
				for(var i = i_start; i < min(max_spell + i_start,array_length(check)) ; i += 1)
				{
					set_font(FONT_SPELLPRACTICE);
				
					var is_active = (cursor[level] == i);
					
					check[i].active_offset = goto_value(check[i].active_offset, is_active * 10,3);
					
					var lan_off = global.lan = LAN_JAP ? 1 : 0;
					//name
					draw_text_color(200 + check[i].active_offset,60 + (i - i_start) * 20 + lan_off,check[i].title,c_white,c_white,c_white,c_white,1 - !is_active * 0.6);
					
					//spell comment
					if(is_active)
					{
						draw_text_color(100,410,get_text("spell_comment"),c_white,c_white,c_white,c_white,menu_description_alpha);
						draw_text_color(100,426,"------------------------------------------------------",c_white,c_white,c_white,c_white,menu_description_alpha);
						draw_text_ext_color(100,448,check[i].comment,20,750,c_white,c_white,c_white,c_white,menu_description_alpha);
					}
					
					draw_set_font(font_spellpractice);
					
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
				}
				
				//little arrow when 2 pages
				if(array_length(check) > max_spell)
				{
					var y_sc = i_start == max_spell ? -1 : 1;
					
					draw_sprite_ext(spr_morespell,0,580,220 + y_sc * 180,1,y_sc,0,c_white,1);	
				}
				
			break;
			case 5:
				draw_replay = true;
			break;
			case 6: //controle
				
				set_font(FONT_MAIN);
				
				var xx = 450;
				var yy = 110;
				var xx2 = xx + 50;
				
				for(var i = 0; i < array_length(check); i += 1)
				{
					var is_active = (cursor[level] == i);
					
					var txt = check[i].title;
					
					var single = i >= 4;
					
					draw_text_color(xx + single * 40 - string_width(txt) / (1 + single),yy + i * 60,txt,c_white,c_white,c_white,c_white,1 - !is_active * 0.7);
					
					if(!single)
					{
						if(last_controle)
						{
							switch(i)
							{
								case 0://shot
									var txt = btn[global.shot_btn];
								break;
								case 1://focus
									var txt = btn[global.focused_btn];
								break;
								case 2://bomb
									var txt = btn[global.bomb_btn];
								break;
								case 3://pause
									var txt = btn[global.pause_btn];
								break;
							} 
						}
						else
						{
							switch(i)
							{
								case 0://shot
									var vk = global.shot_vk;
								break;
								case 1://focus
									var vk = global.focused_vk;
								break;
								case 2://bomb
									var vk = global.bomb_vk;
								break;
								case 3://pause
									var vk = global.pause_vk;
								break;
							} 
						
							txt = vk < array_length(key) ? key[vk] : "None";
						}
					
						draw_text_color(xx2 ,yy + i * 60,txt,c_white,c_white,c_white,c_white,1 - !is_active * 0.7);
					}
				}
			break;
		}
	break;
	case 3:
		switch(cursor[0])//stage select
		{
			case 2:
				draw_player = true;
				draw_stage_practice = true;
			break;
		}
	break;
}


if(draw_player)
{
	set_font(FONT_MAIN);
	var txt = get_text("menu_chose_player");
	draw_text(480 - string_width(txt) / 2,34,txt);
	
	draw_line_width(465,198,global.lan == LAN_ENG ? 821 : 748,198,2);
				
	for(var i = 0; i < 3; i += 1)
	{
		var col = c_white;
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
			
		shader_set(shad_white)
		var alp = player[i].alpha;
		draw_sprite_ext(art,0,player[i].x_is - 1,260,1,1,0,col,alp);
		draw_sprite_ext(art,0,player[i].x_is + 1,260,1,1,0,col,alp);
		draw_sprite_ext(art,0,player[i].x_is,259,1,1,0,col,alp);
		draw_sprite_ext(art,0,player[i].x_is,261,1,1,0,col,alp);
		shader_reset();
			
					
		if(cursor[0] == 1)//extra
		{
			if(!extra_unlock[i])
			{
				shader_set(shad_greyscale);
				col = $5a5a5a;
			}
		}
					
		draw_sprite_ext(art,0,player[i].x_is,260,1,1,0,col,player[i].alpha);
		shader_reset();
					
		//draw description
		var spr = global.lan == LAN_ENG ? spr_player_description : spr_player_description_j;
		draw_sprite_ext(spr,global.player_chosen,685,240,1,1,0,c_white,1);
					
	}
				
	var dif = cursor[0] != 1 ? global.difficulty : 4;
	var spr = global.lan == LAN_ENG ? spr_difficulty : spr_difficulty_j;
			
	draw_sprite_ext(spr,dif,difficuly[dif].x_is,difficuly[dif].y_is,1,1,0,c_white,1);

}




if(draw_stage_practice)
{
	var xx = 450 - 20;
	var yy = 140 - 20;
	var width = 175;
	var height = 275;
	var wid = 3;
	draw_sprite_part(spr_main,1,xx,yy,width,height,xx,yy)
	
	draw_line_width(xx,yy,xx + width,yy,wid);
	draw_line_width(xx + width,yy,xx + width,yy + height,wid);
	draw_line_width(xx,yy + height,xx + width,yy + height,wid);
	draw_line_width(xx,yy,xx,yy + height,wid);
	
	for(var i = 0; i < array_length(check); i += 1)
	{
		var is_active = (cursor[level] == i);
					
		var col = check[i].action != MENU_INVALID ? c_white : $5a5a5a;
					
		check[i].active_offset = goto_value(check[i].active_offset,13 * is_active,6);
				
		draw_set_font(font_main);
		
		draw_text_color(450 + check[i].active_offset,140 + i * 40,check[i].title,col,col,col,col,1 - !is_active * 0.6);
	}	
}




if(draw_replay)
{
	var check = menu[cursor[0]].param;
	
	switch(global.lan)
	{
		case LAN_ENG:
			draw_set_font(font_replay);
		break;
		case LAN_JAP:
			draw_set_font(global.font_spellpractice_j);
		break;
	}
		
	
			
	draw_text(170,32,get_text("menu_look_replay"));
	var xx = 230;
	var yy = 70;
	var dist = 22;
	
	draw_set_font(font_replay);
	
	for(var i = 0; i < array_length(check); i += 1)
	{
		is_active = (cursor[1] == i)
					
		//relplay number
		draw_text_color(xx - 140,yy + i * dist,"ReplayN" + string(add_zero(i + 1,2)) + " //",c_white,c_white,c_white,c_white,1 - !is_active * 0.6 );
		//name
		draw_text_color(xx - 10 ,yy + i * dist,check[i].nom,c_white,c_white,c_white,c_white,1 - !is_active * 0.6 );
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
	
	
	if(level == 2)
	{		
		var check = menu[cursor[0]].param[cursor[1]].param;
		
		var x1 = 400;
		var y1 = 180;
		var width = 295;
		var height = 37 + array_length(check) * 20;
		draw_sprite_part(spr_main,1,x1,y1,width,height,x1,y1);
		var wid = 4;
		draw_line_width(x1,y1,x1 + width,y1,wid);
		draw_line_width(x1 + width,y1,x1 + width,y1 + height,wid);
		draw_line_width(x1,y1 + height,x1 + width,y1 + height,wid);
		draw_line_width(x1,y1,x1,y1 + height,wid);
				
		draw_set_font(font_replay);
				
		for(var i = 0; i < array_length(check); i += 1)
		{
			var is_active = (cursor[level] == i);
			var col = check[i].action == MENU_PLAY_REPLAY ? c_white : $5a5a5a;
					
			draw_text_color(x1 + 20 + 5 * is_active, y1 + 20 + i * 20,check[i].title + " : ",col,col,col,col,1 - !is_active * 0.6)
			draw_score(check[i].scr,x1 + 265 + 5 * is_active, y1 + 20 + i * 20,spr_score,1,1 - !is_active * 0.6);	
		}
	}
}

//draw_text(20,20,keyboard_string);
