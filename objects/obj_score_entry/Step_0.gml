/// @description Insert description here
// You can write your code in this editor

if (old_state != state)
{
	old_state = state;
	state_time = 0;
}
else
{
	state_time += 1;
}

alpha_score = goto_value(alpha_score,0.85,0.1);

switch(state)
{
	case 0:
	
		names[score_pos] = global.name_entry;
		
		if(!instance_exists(obj_name_entry))
		{
			
			//write new scores
			for(var i = 0; i < array_length(scores); i += 1)
			{
				data_write("Data.ini",index,i,scores[i]);
				data_write("Data.ini",index + "_name",i,names[i]);
			}
			
			global.name_entry = "";
			
			if(room = room_score)
			{
				state = 4;	
			}
			else
			{
				instance_destroy();
			}
		}
	break;
	case 1:
		if(!instance_exists(obj_replay))
		{
			menu_alpha = goto_value(menu_alpha,1,0.03);
		
			if(cursor_lockout == 0)
			{
				if(abs(global.up_pressed - global.down_pressed))
				{
					cursor += global.up_pressed - global.down_pressed;
					cursor %= array_length(menu);
					cursor += cursor < 0 ? array_length(menu) : 0;
	
					play_sound(sfx_menu_move,1,false);
				}

				if(global.shot_pressed)
				{
					play_sound(sfx_menu_valid,1,false);
				
					switch(menu[cursor].action)
					{
						case MENU_TITLE:
							room_transition(room_main,true);
							cursor_lockout = 100000;
						break;
						case MENU_REPLAY:
							instance_create_depth(0,0,depth - 1, obj_replay);
							cursor_lockout = 10;
						break;
					}
				}
				
				if(global.bomb_pressed)
				{
					play_sound(sfx_menu_back,1,false);
					cursor_lockout = 10000;
					room_transition(room_main,true);
				}
			}
			else
			{
				cursor_lockout -= 1;
			}
		}
		else
		{
			cursor_lockout = 10;
		}
	break;
	case 2:
		menu_alpha = goto_value(menu_alpha,1,0.03)
		if(menu_alpha == 1)
		{
			state += 1;	
		}
	break;
	case 3:
		if(state_time == 160)
		{
			room_transition(room_main,true);
		}
	break;
	case 4://results
		result_alpha = goto_value(result_alpha,1,0.05);
		
		if(state_time > 80) and (global.shot_pressed)
		{
			play_sound(sfx_menu_valid,1,false);
			
			if (global.continues != global.continues_max)
			{
				state = 2;
			}
			else
			{
				state = 1;
			}
		}
	break;
}
