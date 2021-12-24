/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	bgm_vol = goto_value(bgm_vol,0,0.02);
	audio_emitter_gain(global.bgm_emitter,bgm_vol)
	
	switch(state)
	{
		case 0:
			alpha = goto_value(alpha,1,0.04);
			if(alpha == 1)
			{
				state += 1;
				with(all)
				{
					if(object_get_parent(object_index) == parent_bg)
					{
						instance_destroy();	
					}
				}
			}
		break;
	}
}
// Inherit the parent event
event_inherited();

