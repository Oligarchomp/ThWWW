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
}