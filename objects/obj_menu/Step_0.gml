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


	if(global.shot_pressed)
	{
		var act = array_check[cursor[level]].action;
	
		switch(act)
		{
			case MENU_NOTHING:
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
				room_transition(room_gp);

				var param = array_check[cursor[level]].param;
				
				if(param == 7)
				{
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
				room_transition(room_gp);
				global.play_type = PLAY_REPLAY;
				
				var ev = get_replay(REPLAY_EVENT,"Replay.txt");
				var wait = get_replay(REPLAY_WAIT,"Replay.txt");
				
				for (var i = 0; i < array_length(ev); i += 1)
				{
					add_stage_event(asset_get_index(object_get_name(ev[i])),wait[i]);
				}
				
				global.game_type = get_replay(REPLAY_GAMETYPE,"Replay.txt");
				global.player_chosen = get_replay(REPLAY_PLAYER,"Replay.txt");
				global.difficulty = get_replay(REPLAY_DIFFICULTY,"Replay.txt");
				
				global.replay_input = get_replay(REPLAY_INPUT,"Replay.txt");
				global.replay_input_time = get_replay(REPLAY_INPUT_TIME,"Replay.txt");
				
				global.replay_seed = get_replay(REPLAY_SEED,"Replay.txt");
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
			cursor_lockout = 10;
		}
		else
		{
			if(cursor[0] != 8)
			{
				cursor[0] = 8;
			}
			else
			{
				game_end();	
			}
		}
	
		play_sound(sfx_menu_back,1,false);
		
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

