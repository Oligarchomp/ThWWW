/// @description Insert description here
// You can write your code in this editor

bgm = noone;
old_bgm = bgm;

bgm_intro = noone;
old_bgm_intro = bgm_intro;

bgm_intro_wait = 0;

bgm_emit = audio_emitter_create()

if (!audio_is_playing(bgm))
{
	audio_play_sound_on(bgm_emit,bgm,true,1);
}
