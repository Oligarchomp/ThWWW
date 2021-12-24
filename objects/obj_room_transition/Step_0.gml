/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	if (old_state != state)
	{
		old_state = state;
		state_time = 0;
	}
	else
	{
		state_time += 1;
	}

	switch(state)
	{
		case 0:
			if(state_time == 0)
			{
				if(!instance_exists(bg_to_create))
				{
					instance_create_depth(0,0,0,bg_to_create);
				}
			}
		
			alpha = goto_value(alpha,0,0.04);
			
			if(alpha == 0) or (global.game_type == GAME_SPELL)
			{
				state = 1;
				
				if(global.game_type != GAME_SPELL)
				{
					set_bgm(music);
				}
				else
				{
					if(!audio_is_playing(music))
					{
						set_bgm(music);
					}
				}
				
				event_next()
				instance_destroy();
			}
		break;
	}
	
}