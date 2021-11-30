/// @description Insert description here
// You can write your code in this editor

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
	if(global.game_type == GAME_FULL)
	{
		pause_state = 1;
		pause_type = PAUSE_GAMEOVER;
	}
	else
	{
		pause_state = 1;
		pause_type = PAUSE_END;
	}
}


//pause
switch(pause_state)
{
	case 1: //paused
		text_offset = goto_value(text_offset,0,-text_offset_max / pause_spd );
		pause_alpha = goto_value(pause_alpha,1,1 / pause_spd);
	break;
	case 2: // leaving pause
		text_offset = goto_value(text_offset,text_offset_max,-text_offset_max / pause_spd );
		pause_alpha = goto_value(pause_alpha,0,1 / pause_spd);
		if(pause_alpha == 0)
		{
			pause_state = 0;
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
		if(global.shot_changed)
		{
			rep += "a";	
		}
		if(global.bomb_changed)
		{
			rep += "b";	
		}
		if(global.focused_changed)
		{
			rep += "x";	
		}
		if(global.left_changed)
		{
			rep += "l";	
		}
		if(global.right_changed)
		{
			rep += "r";	
		}
		if(global.up_changed)
		{
			rep += "u";	
		}
		if(global.down_changed)
		{
			rep += "d";	
		}
	

		if(rep != "")
		{
			replay[global.time]	= rep;
		}
		
	}
	else
	{
		
		if (next_input_time_index < array_length(global.replay_input_time)) and (global.replay_input_time[next_input_time_index] == global.time)
		{
			var input = global.replay_input[next_input_time_index];
			
			if(string_count("a",input) == 1)
			{
				global.shot_down = !global.shot_down;
			}
			
			if(string_count("b",input) == 1)
			{
				global.bomb_down = !global.bomb_down;
			}
			
			if(string_count("x",input)== 1)
			{
				global.focused_down = !global.focused_down;	
			}
			
			if(string_count("u",input)== 1)
			{
				global.up_down = !global.up_down;	
			}
			
			if(string_count("d",input)== 1)
			{
				global.down_down = !global.down_down;	
			}
			
			if(string_count("l",input)== 1)
			{
				global.left_down = !global.left_down;	
			}
			
			if(string_count("r",input)== 1)
			{
				global.right_down = !global.right_down;	
			}
			
			next_input_time_index += 1;
		}
		
	}

}


