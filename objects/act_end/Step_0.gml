/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	alpha = goto_value(alpha,1,0.005);
	
	bgm_vol = goto_value(bgm_vol,0,bgm_vol_ref / 200);
	audio_emitter_gain(global.bgm_emitter,bgm_vol)
	
	if(alpha == 1)
	{
		room_goto(room_end);
	}

}


