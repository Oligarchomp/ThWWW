/// @description Insert description here
// You can write your code in this editor

if(step % 50 == 0)
{
	instance_create_depth(80 - 100 + rng(200,false,6),440 - rng(60,false,3),depth + 1,obj_bubble_main);
}


menu_description_alpha = goto_value(menu_description_alpha,1,0.1);

if(cursor_lockout == 0)
{
	switch(level)
	{
		case 0:
			var array_check = menu;
		break;
		case 1:
			var array_check = menu[cursor[0]].param;
		break;
		case 2:
			var array_check = menu[cursor[0]].param[cursor[1]].param;
		break;
		case 3:
			var array_check = menu[cursor[0]].param[cursor[1]].param[cursor[2]].param;
		break;
	}

	//holding
	if(abs(global.down_down - global.up_down))
	{
		hold_direction_time += 1;
		
		if(hold_direction_time > 30)
		{
			if(hold_direction_time % 6 == 0)
			{
				global.down_pressed = global.down_down;
				global.up_pressed = global.up_down;
			}
		}
	}
	else
	{
		hold_direction_time = 0;
	}

	if(abs(global.down_pressed - global.up_pressed))
	{
		last_controle = !keyboard_check(vk_anykey);
		
		var pos_then = cursor[level];
		
		//moving cursor
		var lenght = array_length(array_check);
		
		cursor[level] += global.down_pressed - global.up_pressed;
		cursor[level] %= lenght;
		cursor[level] += cursor[level] < 0 ? lenght : 0;
		
		if(pos_then != cursor[level])
		{
			play_sound(sfx_menu_move,1,false);
			
			menu_description_alpha = 0;
		}
	
		switch(level)
		{
			case 1:
				switch(cursor[0])//difficulty
				{
					case 0:
					case 2:
						global.difficulty += global.down_pressed - global.up_pressed;
						global.difficulty %= 4;
						global.difficulty += global.difficulty < 0 ? 4 : 0;
						
						play_sound(sfx_menu_move,1,false);
					break;
					case 4:
						score_difficulty += global.down_pressed - global.up_pressed;
						score_difficulty %= 5;
						score_difficulty += score_difficulty < 0 ? 5 : 0;
						
						play_sound(sfx_menu_move,1,false);
					break;
				}
			break;
		}
	}

	if(abs(global.right_pressed - global.left_pressed))
	{
		last_controle = !keyboard_check(vk_anykey);
		
		var need_move = false;
		switch(cursor[0])//player
		{
			case 0:
			case 1:
			case 2:
				if(level == 2)
				{
					var need_move = true;
				}
			break;
			case 4:
				if(level == 1)
				{
					var need_move = true;
				}
			break;
		}
		
		if(need_move)
		{
			global.player_chosen += global.right_pressed - global.left_pressed;
			global.player_chosen %= 3;
			global.player_chosen += global.player_chosen < 0 ? 3 : 0;
				
			play_sound(sfx_menu_move,1,false);
		}
		
	}
	var checking_input = false;
	//OPTIONS
	if (cursor[0] == 6)
	{
		switch(level)
		{
			case 2:
				checking_input = true;
				
				if(cursor[level] < 4)
				{
					for(var i = 0; i < array_length(key); i += 1)
					{
						if (key[i] != 0) and (keyboard_check_pressed(i))
						{
							play_sound(sfx_menu_valid,1,false);
							
							last_controle = 0;
							
							var skip_shot = false;
							var skip_bomb = false;
							var skip_focused = false;
							var skip_pause = false;
							switch(cursor[level])
							{
								case 0:
									var old_vk = global.shot_vk;
									global.shot_vk = i;
									skip_shot = true;
								break;
								case 1:
									var old_vk = global.focused_vk;
									global.focused_vk = i;
									skip_focused = true;
								break;
								case 2:
									var old_vk = global.bomb_vk;
									global.bomb_vk = i;
									skip_bomb = true;
								break;
								case 3:
									var old_vk = global.pause_vk;
									global.pause_vk = i;
									skip_pause = true;
								break;
							}
						
							global.shot_vk = global.shot_vk == i and !skip_shot ? old_vk : global.shot_vk;
							global.focused_vk = global.focused_vk == i and !skip_focused ? old_vk : global.focused_vk;
							global.bomb_vk = global.bomb_vk == i and !skip_bomb ? old_vk : global.bomb_vk;
							global.pause_vk = global.pause_vk == i and !skip_pause ? old_vk : global.pause_vk;
						
							
							data_write("Data.ini","option","shot_vk",global.shot_vk);
							data_write("Data.ini","option","focused_vk",global.focused_vk);
							data_write("Data.ini","option","bomb_vk",global.bomb_vk);
							data_write("Data.ini","option","pause_vk",global.pause_vk);
						}
					}
					
					for(var i = gp_face1; i < gp_start; i += 1) //controle
					{
						if(gamepad_button_check_pressed(0,i))
						{
							play_sound(sfx_menu_valid,1,false);
							
							last_controle = 1;
							
							var skip_shot = false;
							var skip_bomb = false;
							var skip_focused = false;
							var skip_pause = false;
							switch(cursor[level])
							{
								case 0:
									var old_btn = global.shot_btn
									global.shot_btn = i;
									skip_shot = true;
								break;
								case 1:
									var old_btn = global.focused_btn
									global.focused_btn = i;
									skip_focused = true;
								break;
								case 2:
									var old_btn = global.bomb_btn
									global.bomb_btn = i;
									skip_bomb = true;
								break;
								case 3:
									var old_btn = global.pause_btn
									global.pause_btn = i;
									skip_pause = true;
								break;
							}
						
							global.shot_btn = global.shot_btn == i and !skip_shot ? old_btn : global.shot_btn;
							global.focused_btn = global.focused_btn == i and !skip_focused ? old_btn : global.focused_btn;
							global.bomb_btn = global.bomb_btn == i and !skip_bomb ? old_btn : global.bomb_btn;
							global.pause_btn = global.pause_btn == i and !skip_pause ? old_btn : global.pause_btn;
						
							
							data_write("Data.ini","option","shot_btn",global.shot_btn);
							data_write("Data.ini","option","focused_btn",global.focused_btn);
							data_write("Data.ini","option","bomb_btn",global.bomb_btn);
							data_write("Data.ini","option","pause_btn",global.pause_btn);
						}
					}
				}
				else
				{
					if(global.shot_pressed)
					{
						
						play_sound(sfx_menu_back,1,false);
						
						if(cursor[level] == 5) //back
						{
							level -= 1;
							cursor_lockout = 8;
						}
						else//default
						{
							if(last_controle)
							{
								global.shot_btn = global.default_shot_btn;
								data_write("Data.ini","option","shot_btn",global.shot_btn);
								global.focused_btn = global.default_focused_btn;
								data_write("Data.ini","option","focused_btn",global.focused_btn);
								global.bomb_btn = global.default_bomb_btn;
								data_write("Data.ini","option","bomb_btn",global.bomb_btn);
								global.pause_btn = global.default_pause_btn;
								data_write("Data.ini","option","pause_btn",global.pause_btn);
							}
							else
							{
								global.shot_vk = global.default_shot_vk;
								data_write("Data.ini","option","shot_vk",global.shot_vk);
								global.focused_vk = global.default_focused_vk;
								data_write("Data.ini","option","focused_vk",global.focused_vk);
								global.bomb_vk = global.default_bomb_vk;
								data_write("Data.ini","option","bomb_vk",global.bomb_vk);
								global.pause_vk = global.default_pause_vk;
								data_write("Data.ini","option","pause_vk",global.pause_vk);
							}
						}
					}
				}
			break;
			case 1:
				switch(cursor[1])
				{
					case 0://fullscreen
						if(global.shot_pressed)
						{
							var fs = data_read("Data.ini","option","fullscreen");
							data_write("Data.ini","option","fullscreen",!fs);
							window_set_fullscreen(!fs);
						}
					break;
					case 1: //sfx volume
						if(abs(global.right_pressed - global.left_pressed))
						{
							var sfx_then = data_read("Data.ini","option","sfx");
							var sfx = sfx_then + global.right_pressed - global.left_pressed;
							sfx = sfx > 10 ? 10 : sfx;
							sfx = sfx < 1 ? 1 : sfx;
					
							if (sfx != sfx_then)
							{
								play_sound(sfx_menu_move,1,false);	
							}
					
							global.sfx_volume = sfx;
					
							audio_emitter_gain(global.sfx_emitter,(global.sfx_volume - 1) * global.sound_mult / 10);
					
							data_write("Data.ini","option","sfx",sfx);
						}
					break;
					case 2: //bgm volume
						if(abs(global.right_pressed - global.left_pressed))
						{
							var bgm_then = data_read("Data.ini","option","bgm");
							var bgm = bgm_then + global.right_pressed - global.left_pressed;
							bgm = bgm > 10 ? 10 : bgm;
							bgm = bgm < 1 ? 1 : bgm;
					
							if (bgm != bgm_then)
							{
								play_sound(sfx_menu_move,1,false);	
							}
					
							global.bgm_volume = bgm;
					
							audio_emitter_gain(global.bgm_emitter,(global.bgm_volume - 1) * global.sound_mult / 10);
					
							data_write("Data.ini","option","bgm",bgm);
						}
					break;
					case 4://rng patch
						if(rng_unlock)
						{
							if(global.shot_pressed)
							{
								var rng_patch = data_read("Data.ini","option","rng");
								data_write("Data.ini","option","rng",!rng_patch);
								global.rng_patch = !rng_patch;
							}
						}
					break;
				}
			break;
		}
	}
	
	

	if(!checking_input)
	{
		if(global.shot_pressed)
		{
		
			var act = array_check[cursor[level]].action;
	
			switch(act)
			{
				case MENU_NOTHING:
				break;
				case MENU_BACK:
					play_sound(sfx_menu_back,1,false);
				break;
				case MENU_INVALID:
					play_sound(sfx_menu_invalid,1,false);
				break;
				default:
					play_sound(sfx_menu_valid,1,false);
				break;
			}
	
	
			switch(act)
			{
				case MENU_MENU:
					//settign all active offset to 0
					for(var i = 0; i < array_length(array_check[cursor[level]].param); i += 1)
					{
						array_check[cursor[level]].param[i].active_offset = 0;
					}
			
					level += 1;
					cursor[level] = 0;
					cursor_lockout = 10;
				break;
				case MENU_START_GAME:
					room_transition(room_gp);
					add_fullgame();
					cursor_lockout = 100000;
				
					global.game_type = GAME_FULL;
					global.play_type = PLAY_MANUAL;
				
					play_sound(sfx_spawn_light,1,false);
				
					var dif = ["e","n","h","l"];
					var plr = ["r","m","s"];
					var index = dif[global.difficulty] + plr[global.player_chosen];
				
					global.hiscore = variable_struct_get(menu[4].param[0],index)
				break;
				case MENU_START_STAGE:
					var param = array_check[cursor[level]].param;
				
					if(param == 7)
					{
						if(!extra_unlock[global.player_chosen])
						{
							audio_stop_sound(sfx_menu_valid);
							play_sound(sfx_menu_invalid,1,false);
							break;	
						}
						
						global.difficulty = 1;
						global.game_type = GAME_EXTRA;
					
						var plr = ["r","m","s"];
						var index = "ex" + plr[global.player_chosen];
						global.hiscore = variable_struct_get(menu[4].param[0],index)
					}
					else
					{
						global.game_type = GAME_STAGE;
					}
					
					room_transition(room_gp);
				
					global.play_type = PLAY_MANUAL;
				
					add_stage(param);
				
					cursor_lockout = 100000;
				
					play_sound(sfx_spawn_light,1,false);
				break;
				case MENU_SPELL:
					room_transition(room_gp);
				
					global.game_type = GAME_SPELL;
					global.play_type = PLAY_MANUAL;
				
					var param = array_check[cursor[level]].param;
				
					global.difficulty = array_check[cursor[level]].diff;
				
					add_stage_event(menu[cursor[0]].param[cursor[1]].bg,0); // maybe do that better?
					add_stage_event(param,30);
				
					global.menu_level = level;
					global.menu_cursor = cursor;
				
					cursor_lockout = 100000;
				break;
				case MENU_MUSIC:
					set_bgm(array_check[cursor[level]].music,array_check[cursor[level]].intro)
				break;
				case MENU_PLAY_REPLAY:
					var rep = "Replay" + string(cursor[1]) + ".txt";
				
					if(level == 1)
					{
						global.replay_stage_nbr = 1;
					}
					else
					{
						var start = cursor[level] + 1;
					
						global.replay_stage_nbr = start;
					
						if(start > 1)
						{
							global.replay_event_step = real(get_text_file("event_step" + string(start),rep));
							global.replay_x = real(get_text_file("x" + string(start),rep));
							global.replay_y = real(get_text_file("y" + string(start),rep));
							global.replay_life = real(get_text_file("life" + string(start),rep));
							global.replay_bomb = real(get_text_file("bomb" + string(start),rep));
							global.replay_item = real(get_text_file("item" + string(start),rep));
							global.replay_score = real(get_text_file("score" + string(start),rep));
							global.replay_graze = real(get_text_file("graze" + string(start),rep));
						}
					
					
					}
				
					room_transition(room_gp);
					global.play_type = PLAY_REPLAY;
				
					var ev = get_replay(REPLAY_EVENT,rep,0);
					var wait = get_replay(REPLAY_WAIT,rep,0);
				
					for (var i = 0; i < array_length(ev); i += 1)
					{
						add_stage_event(asset_get_index(object_get_name(ev[i])),wait[i]);
					}
				
					global.game_type = get_replay(REPLAY_GAMETYPE,rep,0);
					global.player_chosen = get_replay(REPLAY_PLAYER,rep,0);
					global.difficulty = get_replay(REPLAY_DIFFICULTY,rep,0);
				
					var rng_then = global.rng_patch
					global.rng_patch = get_text_file("rng",rep);
				
					global.need_change_rng = rng_then != global.rng_patch;
				
					var stage_nbr = get_replay(REPLAY_STAGE_NBR,rep,0);
				
					for(var i = 0; i < stage_nbr; i += 1)
					{
						global.replay_input[i] = get_replay(REPLAY_INPUT,rep,i + 1);
						global.replay_input_time[i] = get_replay(REPLAY_INPUT_TIME,rep,i + 1);
				
						global.replay_seed[i] = get_replay(REPLAY_SEED,rep,i + 1);
					}
				
					global.menu_level = level;
					global.menu_cursor = cursor;
				
					cursor_lockout = 100000;
				break;
				case MENU_BACK:
					level -= 1;
					cursor_lockout = 8;
				break;
				case MENU_QUIT:
					game_end();
				break;
			}
		}

		if(global.bomb_pressed)
		{
		
			if(level > 0)
			{
				level -= 1;
				cursor_lockout = 8;
			}
			else
			{
				if(cursor[0] != 9)
				{
					cursor[0] = 9;
				}
				else
				{
					game_end();	
				}
			}
	
			play_sound(sfx_menu_back,1,false);
		}
	
	}
	
	
}
else
{
	cursor_lockout -= 1;
}



//difficulty position

for(var i = 0; i < 5; i += 1)
{
	if(level < 2)
	{
		if(i < 4)
		{
			difficuly[i].x_to = 650 - abs(global.difficulty - i) * 30;
			difficuly[i].y_to = 250 - (global.difficulty - i) * 280;
	
			difficuly[i].alpha_to = 1 - abs(global.difficulty - i) * 0.2;
			difficuly[i].scale_to = 1 - abs(global.difficulty - i) * 0.2;
		}
		else
		{
			difficuly[i].x_to = 650;
			difficuly[i].y_to = 260;
	
			difficuly[i].alpha_to = 1;
			difficuly[i].scale_to = 1;
		}
	}
	else
	{
		if(global.difficulty == i) or (i == 4)
		{
			difficuly[i].x_to = 200;
			difficuly[i].y_to = 164;
		}
	}
	
	difficuly[i].y_is += recursiv(difficuly[i].y_is,difficuly[i].y_to,5,0.1);
	difficuly[i].x_is += recursiv(difficuly[i].x_is,difficuly[i].x_to,5,0.1);
	difficuly[i].scale += recursiv(difficuly[i].scale,difficuly[i].scale_to,5,0.1);
	difficuly[i].alpha += recursiv(difficuly[i].alpha,difficuly[i].alpha_to,5,0.1);
}

for(var i = 0; i < 3; i += 1)
{
	if(global.player_chosen == i)
	{
		player[i].alpha_to = 1;
		player[i].x_to = 700;
	}
	else
	{
		player[i].alpha_to = 0;
	}
	
	player[i].x_is = goto_value(player[i].x_is,player[i].x_to,8);
	player[i].alpha = goto_value(player[i].alpha,player[i].alpha_to,0.05);
}


step += 1;

