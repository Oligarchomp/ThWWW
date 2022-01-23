/// @description Insert description here
// You can write your code in this editor
var need_stage_replay = false;
var final_stage_replay = false;
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
		
		if(wait_time == wait)
		{
			var ev = global.event_list[|event_step];
			if(!instance_exists(ev))
			{
				instance_create_depth(0,0,0,ev);
			
				if(object_get_parent(ev) == obj_room_transition)
				{
					need_stage_replay = true;
					final_stage_replay = ev == act_end;
				}

			}
		}
		else
		{
			wait_time += 1;
		}
		
	}
	else
	{
		var end_time = 110 + (global.game_type == GAME_EXTRA) * 60;
		switch(end_wait)
		{
			case end_time:
	
				if(global.play_type == PLAY_MANUAL)
				{
					switch(global.game_type)
					{
						case GAME_EXTRA:
							instance_create_depth(280,40,0,obj_score_entry);
							
							set_bgm(mus_score);
							
							data_write("Data.ini","data","rng_unlock",1); //unlock rng patch
						break;
					}
				}
	
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
			break;
		}
		
		end_wait = goto_value(end_wait,end_time,1);
		
	}

	if(global.item_nbr >= item_extend[|0]) and (global.item_nbr < 9999)
	{
		ds_list_delete(item_extend,0);
		
		global.life += 1;
		
		play_sound(sfx_extend,1,false);
	}
	
	global.score -= global.score % 10;//failsafe
	
	score_to_draw += round(recursiv(score_to_draw,global.score,8,100));
	score_to_draw -= score_to_draw % 10 
	score_to_draw += global.continues_max - global.continues;
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


if(global.life < 0) and (pause_state == 0)
{
	pause_state = 1;
	
	if(global.play_type == PLAY_MANUAL)
	{
		if(global.continues == global.continues_max) and (global.game_type == GAME_FULL)
		{
			instance_create_depth(280,40,0,obj_score_entry);
			
			if(global.score > global.hiscore) and (!global.rng_patch)
			{
				global.hiscore = global.score;
			}
		}
		
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



//pause
switch(pause_state)
{
	case 1: //paused
		if(pause_state_time == 0)
		{
			old_fps = room_speed;
			room_speed = 60;
			
			yingying_rot_spd = 12;
			
			if(pause_type = PAUSE_GAMEOVER)
			{
				set_bgm(mus_score);
			}
			
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
				
				if(pause_type == PAUSE_GAMEOVER) or (pause_type == PAUSE_END)
				{
					need_stage_replay = true;
					final_stage_replay = true;
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
			room_speed = old_fps;
			if(continue_song)
			{
				continue_song = false;
				set_bgm(-1);//-1 means restarting remembered song	
			}
			
			pause_state = 0;
			pause_type = PAUSE_MANUAL;
			
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

if(need_stage_replay)
{
	reset_controle();
	obj_player.x = round(obj_player.x);
	obj_player.y = round(obj_player.y);
	
	global.stage_number += 1
	
	if(global.play_type = PLAY_MANUAL)
	{
		if(global.stage_number > 0)
		{
			var seed = random_get_seed();
						
			var file = file_text_open_append(working_directory + "Replay_Write.txt");
						
			var input = "input" + string(global.stage_number) + " = ";
			var input_time = "input_time" + string(global.stage_number) + " = ";
			for(var i = 0; i < array_length(replay); i += 1)
			{
				if (string(replay[i]) != 0)
				{
					input += replay[i] + ",";
					input_time += string(i) + ",";
				}
			}
			replay = [];
				
			var nbr = string(global.stage_number);
			var nbr1 = string(global.stage_number + 1)
				
			file_text_writeln(file);
			file_text_write_string(file,"seed" + nbr + " = " + string(seed));
			file_text_writeln(file);
			file_text_write_string(file,input);
			file_text_writeln(file);
			file_text_write_string(file,input_time);
			if(final_stage_replay)
			{
				file_text_writeln(file);
				file_text_write_string(file,"stage_nbr = " + string(global.stage_number));
			}
			else
			{
				file_text_writeln(file);
				file_text_write_string(file,"event_step" + nbr1 + " = " + string(event_step));
				file_text_writeln(file);
				file_text_write_string(file,"x" + nbr1 + " = " + string(obj_player.x));
				file_text_writeln(file);
				file_text_write_string(file,"y" + nbr1 + " = " + string(obj_player.y));
				file_text_writeln(file);
				file_text_write_string(file,"life" + nbr1 + " = " + string(global.life));
				file_text_writeln(file);
				file_text_write_string(file,"bomb" + nbr1 + " = " + string(global.bomb));
				file_text_writeln(file);
				file_text_write_string(file,"item" + nbr1 + " = " + string(global.item_nbr));
				file_text_writeln(file);
				file_text_write_string(file,"graze" + nbr1 + " = " + string(global.graze));
			}
			file_text_writeln(file);
			file_text_write_string(file,"score" + nbr1 + " = " + string(global.score));
			
			file_text_close(file);
		}
		
		randomise();
		global.time = 0;
	}
	else
	{
		random_set_seed(global.replay_seed[global.stage_number]);
		
		next_input_time_index = 0;
		global.time = 0;
	}
	
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
		
		if (next_input_time_index < array_length(global.replay_input_time[global.stage_number])) and (global.replay_input_time[global.stage_number][next_input_time_index] == global.time)
		{
			var input = global.replay_input[global.stage_number][next_input_time_index];
			
			for (var i = 1; i <= string_length(input); i += 1)
			{
				switch(string_char_at(input,i))
				{
					case "a" :
						global.shot_down = !global.shot_down;
					break;
					case "A" :
						global.shot_pressed = true;
					break;
					case "b" :
						global.bomb_down = !global.bomb_down;
					break;
					case "B" :
						global.bomb_pressed = true;
					break;
					case "x" :
						global.focused_down = !global.focused_down;
					break;
					case "X" :
						global.focused_pressed = true;
					break;
					case "u" :
						global.up_down = !global.up_down;
					break;
					case "d" :
						global.down_down = !global.down_down;
					break;
					case "l" :
						global.left_down = !global.left_down;
					break;
					case "r" :
						global.right_down = !global.right_down;
					break;
				}
			}
			/*
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
			*/
			next_input_time_index += 1;
		}
		
	}

}


