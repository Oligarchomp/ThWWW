/// @description Insert description here
// You can write your code in this editor

//event action
if(global.gp_active)
{	
	var wait = global.wait_list[|event_step]
	
	if (event_step < ds_list_size(global.event_list))
	{
		if (event_step != last_event_step)
		{
			last_event_step = event_step;
		
			event_time = 0;
			wait_time = 0;
		}
	}
	else
	{
		end_wait = goto_value(end_wait,110,1);
		if(end_wait == 110)
		{
			pause_state = 1;
		
			pause_type = PAUSE_END;
			play_sound(sfx_pause,1,false);
			
			if(global.play_type == PLAY_MANUAL)
			{
				if(global.game_type == GAME_SPELL)
				{
					cursor[0] = array_length(cursor);	
				}
			}
			else
			{
				cursor[0] = 1;
			}
			
			//saving input
			if(global.play_type == PLAY_MANUAL)
			{
				var input = "input = ";
				var input_time = "input_time = ";
				for(var i = 0; i < array_length(replay); i += 1)
				{
					if (string(replay[i]) != 0)
					{
						input += replay[i] + ",";
						input_time += string(i) + ",";
					}
				}
				var file = file_text_open_append(working_directory + "Replay.txt");
				file_text_writeln(file);
				file_text_write_string(file,input);
				file_text_writeln(file);
				file_text_write_string(file,input_time);
				file_text_close(file);
			}
		}
	}
	
	if(wait_time == wait)
	{
		
		var ev = global.event_list[|event_step];
		if(!instance_exists(ev))
		{
			instance_create_depth(0,0,0,ev);
		}
		
	}
	else
	{
		wait_time += 1;
	}
	

	if(global.item_nbr >= item_extend[|0])
	{
		ds_list_delete(item_extend,0);
		
		global.life += 1;
		
		play_sound(sfx_extend,1,false);
	}
	
	global.score -= global.score % 10;//failsafe
	
	score_to_draw += round(recursiv(score_to_draw,global.score,10,100));
	score_to_draw -= score_to_draw % 10;
	
}

//PAUSE

switch(pause_type)
{
	case PAUSE_MANUAL:
		if(global.play_type == PLAY_MANUAL)
		{
			var menu = pause;
		}
		else
		{
			var menu = replay_menu;
		}
	break;
	case PAUSE_END:
		if(global.play_type == PLAY_MANUAL)
		{
			var menu = done;
		}
		else
		{
			var menu = replay_menu;
		}
	break;
	case PAUSE_GAMEOVER:
		var menu = gameover;
	break;
}

switch(level)
{
	case 0:
		var array_check = menu;
	break;
	case 1:
		var array_check = menu[cursor[0]].param;
	break;
}
		
		
if(pause_state == 1) and (cursor_lockout == 0)
{
	if(abs(global.down_pressed - global.up_pressed))
	{
		
		play_sound(sfx_menu_move,1,false);
	
		//moving cursor
		var lenght = array_length(array_check);
		
		cursor[level] += global.down_pressed - global.up_pressed;
		cursor[level] %= lenght;
		cursor[level] += cursor[level] < 0 ? lenght : 0;
	}


	if(global.shot_pressed)
	{
		
	
		var act = array_check[cursor[level]].action;
	
		switch(act)
		{
			case MENU_MENU:
				level += 1;
				cursor[level] = 1;
				pause[cursor[0]].param[0].active_offset = 0; //:/
				pause[cursor[0]].param[1].active_offset = menu_offset;
			break;
			case MENU_BACK:
				level -= 1;
			break;
			case MENU_RESTART:
				room_transition(room_reload);
				cursor_lockout = 1000;
			break;
			case MENU_TITLE:
				room_transition(room_main);
				cursor_lockout = 1000;
			break;
			case MENU_CONTINUE:
				level -= 1;
				global.continues -= 1;
				
				global.life = global.starting_life;
				global.bomb = global.starting_bomb;
				
				play_sound(sfx_extend,1,false);
				
				if(global.continues == 0)
				{
					gameover[0].action = MENU_INVALID;
				}
			break;
		}
		
		switch(act)
		{
			case MENU_INVALID:
				play_sound(sfx_menu_invalid,1,false);
			break;
			default:
				play_sound(sfx_menu_valid,1,false);
			break;
		}
	}
	
	
	
	if(global.bomb_pressed)
	{
		if(pause_type == PAUSE_MANUAL)
		{
			level -= 1;
	
			play_sound(sfx_menu_back,1,false);
		}
	}

	if(level < 0)
	{
		level = 0;
		pause_state = 2;
	}
}

