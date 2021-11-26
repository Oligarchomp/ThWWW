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
	
	if(obj_gameplay.event_step != 0) // if not the first transition
	{
		transition = true;
		switch(state)
		{
			case 0:
				alpha = goto_value(alpha,1,0.05);
				if(alpha == 1)
				{
					state = 1;
				}
			break;
			case 1:
				if (state_time == 60)
				{
					state = 2;
					with(bg_to_destroy)
					{
						instance_destroy();
					}
					instance_create_depth(0,0,0,bg_to_create);
				}
			break;
			case 2:
				alpha = goto_value(alpha,0,0.05);
				if(alpha == 0)
				{
					set_bgm(music,noone);
				
					event_next()
					instance_destroy();
				}
			break;
		}
	}
	else
	{
		switch(state_time)
		{
			case 0:
				instance_create_depth(0,0,0,bg_to_create);
			break;
			case 120:
				set_bgm(music,noone);
				event_next()
				instance_destroy();
			break;
		}
	}
	
	
}