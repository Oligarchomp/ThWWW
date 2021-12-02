/// @description Insert description here
// You can write your code in this editor


if(keyboard_check(vk_space))
{
	x = 0;	
}

if (global.pause_pressed)
{
	if(global.gp_active)
	{
		pause_state = 1;
		play_sound(sfx_pause,1,false);
	}
	else if(pause_alpha == 1) and (pause_type == PAUSE_MANUAL)
	{
		pause_state = 2;
		level = 0;
	}
}


if(global.life < 0)
{
	pause_state = 1;
	
	if(global.play_type == PLAY_MANUAL)
	{
		pause_type = global.game_type == GAME_FULL ? PAUSE_GAMEOVER : PAUSE_END ;
	}
	else
	{
		pause_type = PAUSE_END;
	}
}


if (old_pause_state != pause_state)
{
	old_pause_state = pause_state;
	pause_state_time = 0;
}
else
{
	pause_state_time += 1;
}


if(object_get_parent(get_current_event()) == obj_room_transition)
{
	if(global.stage_number > 0)
	{
	
	}
	
	global.stage_number += 1;
}




//pause
switch(pause_state)
{
	case 1: //paused
		if(pause_state_time == 0)
		{
			
			// replay sync
			if(global.play_type == PLAY_REPLAY)
			{
				mem_shot_down = global.shot_down;
				mem_focused_down = global.focused_down;
				mem_bomb_down = global.bomb_down;

				mem_right_down = global.right_down;
				mem_left_down = global.left_down;
				mem_down_down = global.down_down;
				mem_up_down = global.up_down;
			}
			else
			{
				mem_shot_down = global.shot_down;
				mem_focused_down = global.focused_down;
				mem_bomb_down = global.bomb_down;

				mem_right_down = global.right_down;
				mem_left_down = global.left_down;
				mem_down_down = global.down_down;
				mem_up_down = global.up_down;
				
				//saving input
				if(pause_type == PAUSE_END) or (pause_type == PAUSE_GAMEOVER)
				{
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
						var file = file_text_open_append(working_directory + "Replay_Write.txt");
						file_text_writeln(file);
						file_text_write_string(file,input);
						file_text_writeln(file);
						file_text_write_string(file,input_time);
						file_text_close(file);
					}
				}
			}
		}
		
		text_offset = goto_value(text_offset,0,-text_offset_max / pause_spd );
		pause_alpha = goto_value(pause_alpha,1,1 / pause_spd);
	break;
	case 2: // leaving pause
		text_offset = goto_value(text_offset,text_offset_max,-text_offset_max / pause_spd );
		pause_alpha = goto_value(pause_alpha,0,1 / pause_spd);
		if(pause_alpha == 0)
		{
			pause_state = 0;
			
			
			if(global.play_type == PLAY_REPLAY)
			{
				global.shot_down = mem_shot_down;
				global.focused_down = mem_focused_down;
				global.bomb_down = mem_bomb_down;

				global.right_down = mem_right_down;
				global.left_down = mem_left_down;
				global.down_down = mem_down_down;
				global.up_down = mem_up_down;
			}
			else
			{
				global.shot_changed = mem_shot_down != global.shot_down;
				global.focused_changed = mem_focused_down != global.focused_down;
				global.bomb_changed = mem_bomb_down != global.bomb_down;
				
				global.left_changed = mem_left_down != global.left_down;
				global.right_changed = mem_right_down != global.right_down;
				global.up_changed = mem_up_down != global.up_down;
				global.down_changed = mem_down_down != global.down_down;
			}

		}
	break;
}

global.gp_active = pause_state == 0;


if(global.gp_active)
{
	global.time += 1;
	
	if(global.play_type == PLAY_MANUAL)
	{
		//replay
		var rep = ""
		
		rep += global.shot_changed ? "a" : "";
		rep += global.shot_pressed ? "A" : "";
		rep += global.bomb_changed ? "b" : "";
		rep += global.bomb_pressed ? "B" : "";
		rep += global.focused_changed ? "x" : "";
		rep += global.focused_pressed ? "X" : "";
		rep += global.left_changed ? "l" : "";
		rep += global.right_changed ? "r" : "";
		rep += global.up_changed ? "u" : "";
		rep += global.down_changed ? "d" : "";
	
		if(rep != "")
		{
			replay[global.time]	= rep;
		}
		
	}
	else
	{
		global.shot_pressed = false;
		global.focused_pressed = false;
		global.bomb_pressed = false;
		
		if (next_input_time_index < array_length(global.replay_input_time)) and (global.replay_input_time[next_input_time_index] == global.time)
		{
			var input = global.replay_input[next_input_time_index];
			
			global.shot_down = string_count("a",input) == 1 ? !global.shot_down : global.shot_down;
			global.shot_pressed = string_count("A",input) == 1;
			global.bomb_down = string_count("b",input) == 1 ? !global.bomb_down : global.bomb_down;
			global.bomb_pressed = string_count("B",input) == 1;
			global.focused_down = string_count("x",input) == 1 ? !global.focused_down : global.focused_down;
			global.focused_pressed = string_count("X",input) == 1;
			global.up_down = string_count("u",input) == 1 ? !global.up_down : global.up_down;
			global.down_down = string_count("d",input) == 1 ? !global.down_down : global.down_down;
			global.left_down = string_count("l",input) == 1 ? !global.left_down : global.left_down;
			global.right_down = string_count("r",input) == 1 ? !global.right_down : global.right_down;
			
			next_input_time_index += 1;
		}
		
	}

}


