/// @description Insert description here
// You can write your code in this editor

if(instance_exists(obj_replay)) or (instance_exists(obj_score_entry))
{
	cursor_lockout = 10;
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
		
		
if(pause_state == 1) 
{
	if (cursor_lockout == 0)
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
					level += 1;
					cursor[level] = 1;
					//pause[cursor[0]].param[0].active_offset = 0; //:/
					//pause[cursor[0]].param[1].active_offset = menu_offset;
					//doesn't work because it's not always pause
				break;
				case MENU_BACK:
					if(level == 0)
					{
						if(pause_alpha == 1)
						{
							level -= 1;
						}
						else
						{
							audio_stop_sound(sfx_menu_valid);
						}
					}
					else
					{
						level -= 1;
					}
				break;
				case MENU_RESTART:
					room_transition(room_reload,global.game_type != GAME_SPELL);
					cursor_lockout = 1000;
				break;
				case MENU_TITLE:
					room_transition(room_main,true);
					cursor_lockout = 1000;
				break;
				case MENU_CONTINUE:
					level -= 1;
				
					global.continues -= 1;
					
					global.score = 0;
					score_to_draw = 0;
				
					global.life = global.starting_life;
					global.bomb = global.starting_bomb;
				
					play_sound(sfx_extend,1,false);
				
					continue_song = true;
					
					item_extend = item_extend_ref;
					global.item_nbr = 0;
					
					switch(global.continues)
					{
						case 0:
							gameover[0].action = MENU_INVALID;
						break;
					}
					
					gameover[1].action = MENU_INVALID;
				break;
				case MENU_REPLAY:
					instance_create_depth(200,200,depth - 1,obj_replay);
				break;
			}
		
			
		}
	
	
	
		if(global.bomb_pressed)
		{
			play_sound(sfx_menu_back,1,false);
			
			if(pause_type == PAUSE_MANUAL) or (level > 0)
			{
				if(pause_alpha == 1)
				{
					level -= 1;
				}
				else
				{
					audio_stop_sound(sfx_menu_back);
				}
			}
			else
			{
				var last = array_length(array_check) - 1;
				if(cursor[0] == last)
				{
					room_transition(room_main,true);
					cursor_lockout = 1000;
				}
				else
				{
					cursor[0] = array_length(array_check) - 1;
				}
			}
		}

		if(level < 0)
		{
			level = 0;
			pause_state = 2;
		}
	}
	else
	{
		cursor_lockout -= 1;	
	}
}

yingying_rot -= yingying_rot_spd;
yingying_rot_spd += recursiv(yingying_rot_spd,0.2,14,0.001);

step += 1;