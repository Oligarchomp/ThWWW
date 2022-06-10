/// @description Insert description here
// You can write your code in this editor



switch(last_bgm)
{
	case "title":
		var intro_length = 9.973;
		var loop_lenght = 74.47;
	break;
	case "score":
		var intro_length = 10.175;
		var loop_lenght = 40.865;
	break;
	case "boss1":	
		var intro_length = 7.112;
		var loop_lenght = 119.998;
	break;
	case "boss2":	
		var intro_length = 5.707;
		var loop_lenght = 67.2;
	break;
	case "boss3":	
		var intro_length = 5.488;
		var loop_lenght = 79.059;
	break;
	case "boss4":	
		var intro_length = 10.463;
		var loop_lenght = 87.28;
	break;
	case "boss5":	
		var intro_length = 14.5;
		var loop_lenght = 105.716;
	break;
	case "boss6":	
		var intro_length = 40.452;
		var loop_lenght = 89.600;
	break;
	case "boss7":	
		var intro_length = 11.354;
		var loop_lenght = 174.683;
	break;
	case "stage2":
		var intro_length = 15.58;
		var loop_lenght = 112.21;
	break;
	case "stage3":
		var intro_length = 13.246;
		var loop_lenght = 113.255;
	break;
	case "stage4":
		var intro_length = 13.56;
		var loop_lenght = 170.60;
	break;
	case "stage5":
		var intro_length = 9.082;
		var loop_lenght = 149.93;
	break;
	case "stage6":
		var intro_length = 3.849;
		var loop_lenght = 76.8;
	break;
	case "stage7":
		var intro_length = 16.187;
		var loop_lenght = 217.076;
	break;
	case "end":
		var intro_length = 4.3;
		var loop_lenght = 49.143;
	break;
	case "credit":
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
	if(bgm == "score")
	{
		score_music_mem = last_bgm; //asset_get_index(audio_get_name(currently_playing))
		score_time_mem = audio_sound_get_track_position(currently_playing);
	}
	
	update = false;
	audio_stop_sound(currently_playing);
	
	if(bgm != "")
	{
		
		var was_continued = false;
		if(bgm == "continue")
		{
			bgm = score_music_mem;
			was_continued = true;
		}
		
		if(music_buffer != -1)
		{
			audio_free_buffer_sound(music_buffer);
		}
			
		buffer_load_ext(buffer,working_directory + "/music/" + bgm + ".wav",0)
		buffer_seek(buffer,buffer_seek_start,40);
		var size = buffer_read(buffer,buffer_u32);
			
		buffer_seek(buffer,buffer_seek_start,24);
		var sampling = buffer_read(buffer,buffer_u32);
			
		music_buffer = audio_create_buffer_sound(buffer,buffer_s16,sampling,44,size,audio_stereo);
			
		last_bgm = bgm;
			
		currently_playing = audio_play_sound_on(global.bgm_emitter,music_buffer,true,1);
		
		if(was_continued)
		{
			audio_sound_set_track_position(currently_playing,score_time_mem);
		}
		
	}
}
	
if(global.gp_active)
{
	audio_resume_sound(currently_playing);
}
else
{
	if(global.game_type != GAME_SPELL) and (last_bgm != "score")
	{
		audio_pause_sound(currently_playing);
	}
}

