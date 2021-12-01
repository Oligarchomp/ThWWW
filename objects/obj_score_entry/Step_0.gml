/// @description Insert description here
// You can write your code in this editor


switch(state)
{
	case 0:
	
		names[score_pos] = global.name_entry;
		
		if(!instance_exists(obj_name_entry))
		{
			state = 1;
			
			//write new scores
			for(var i = 0; i < array_length(scores); i += 1)
			{
				data_write("Data.ini",index,i,scores[i]);
				data_write("Data.ini",index + "_name",i,names[i]);
			}
		}
	break;
	case 1:
		
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
						room_transition(room_main);
						cursor_lockout = 100000;
					break;
				}
			}
		}
		else
		{
			cursor_lockout -= 1;
		}
	break;
}
