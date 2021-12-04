///play_sound(soundid,priority,loops)
///@param soundid id
///@param priority real
///@param loops boolean
function play_sound(snd,priority,loop){

	audio_stop_sound(snd);
	
	audio_play_sound_on(global.sfx_emitter,snd,loop,priority)

}