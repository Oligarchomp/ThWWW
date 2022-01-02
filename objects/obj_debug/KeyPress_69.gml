/// @description Insert description here
// You can write your code in this editor
if(global.debug)
{
	var ev = get_current_event();
	var par = object_get_parent(ev);
	if(par == obj_act)
	{
		var play = obj_bgm.currently_playing;
		with(ev)
		{
			audio_sound_set_track_position(play,audio_sound_get_track_position(play) + (act_time_end - step) / 60)
		}
	}
	
	instance_destroy(get_current_event());
	screen_clear(false,true);
	event_next();
	
}