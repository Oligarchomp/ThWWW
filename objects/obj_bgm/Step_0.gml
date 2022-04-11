/// @description Insert description here
// You can write your code in this editor


switch(asset_get_index(audio_get_name(currently_playing)))
{
	case mus_title:
		var intro_length = 9.973;
		var loop_lenght = 74.483;
	break;
	case mus_score:
		var intro_length = 10.175;
		var loop_lenght = 40.865;
	break;
	case mus_boss1:	
		var intro_length = 7.112;
		var loop_lenght = 119.998;
	break;
	case mus_boss2:	
		var intro_length = 5.707;
		var loop_lenght = 67.214;
	break;
	case mus_boss3:	
		var intro_length = 5.488;
		var loop_lenght = 79.059;
	break;
	case mus_boss6:	
		var intro_length = 40.452;
		var loop_lenght = 89.600;
	break;
	case mus_stage2:
		var intro_length = 15.58;
		var loop_lenght = 112.21;
	break;
	case mus_stage3:
		var intro_length = 13.246;
		var loop_lenght = 113.255;
	break;
	case mus_stage5:
		var intro_length = 9.082;
		var loop_lenght = 149.953;
	break;
	case mus_stage6:
		var intro_length = 3.849;
		var loop_lenght = 76.8;
	break;
	case mus_stage7:
		var intro_length = 16.187;
		var loop_lenght = 217.076;
	break;
	case mus_end:
		var intro_length = 4.3;
		var loop_lenght = 49.143;
	break;
	case mus_credit:
		var intro_length = 14.987;
		var loop_lenght = 44.646;
	break;
	default:
		var intro_length = 100000;
		var loop_lenght = 100000;
	break;
}

if(keyboard_check_pressed(ord("T")))
{
	if(global.debug)
	{
		audio_sound_set_track_position(currently_playing,loop_lenght + intro_length - 4);	
	}	
}


var audio_pos = audio_sound_get_track_position(currently_playing)
//audio_sound_set_track_position(currently_playing,audio_pos);

if(audio_pos > intro_length + loop_lenght)
{
	audio_sound_set_track_position(currently_playing,audio_pos - loop_lenght);
}

if(update)
{
	if(bgm == mus_score)
	{
		score_music_mem = asset_get_index(audio_get_name(currently_playing))
		score_time_mem = audio_sound_get_track_position(currently_playing);
	}
	
	update = false;
	audio_stop_sound(currently_playing);
	
	if(bgm != noone)
	{
		if(bgm != -1)
		{
			currently_playing = audio_play_sound_on(global.bgm_emitter,bgm,true,1);
		}
		else // continuing song after gameover
		{
			currently_playing = audio_play_sound_on(global.bgm_emitter,score_music_mem,true,1);
			audio_sound_set_track_position(currently_playing,score_time_mem);
			bgm = asset_get_index(audio_get_name(currently_playing));
		}
	}
}
	
if(global.gp_active)
{
	audio_resume_sound(currently_playing);
}
else
{
	if(global.game_type != GAME_SPELL) and (asset_get_index(audio_get_name(currently_playing)) != mus_score)
	{
		audio_pause_sound(currently_playing);
	}
}