/// @description Insert description here
// You can write your code in this editor


if(bgm_intro == noone)
{
	if(old_bgm != bgm)
	{
		audio_stop_sound(old_bgm);
		audio_stop_sound(old_bgm_intro);
	
		audio_play_sound_on(bgm_emit,bgm,true,1);
		
		old_bgm = bgm;
	}
}
else
{
	
	if(old_bgm_intro != bgm_intro)
	{
		old_bgm_intro = bgm_intro;
		
		bgm_intro_wait = 0;
	}
	
	
	if (bgm_intro_wait == 0)
	{
		audio_stop_sound(old_bgm);
		audio_play_sound_on(bgm_emit,bgm_intro,false,1);
		bgm_intro_wait = floor(audio_sound_length(bgm_intro) * 60);
	}
	else
	{
		bgm_intro_wait -= 1
		
		if(bgm_intro_wait == 0)//if intro is done playing
		{
			bgm_intro = noone;
				
			audio_play_sound_on(bgm_emit,bgm,true,1);
			old_bgm = bgm;
		}
	}
}

