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
			if(state_time == charge_time)
			{
				state = 1;
				mask_index = spr_laser_hitbox;
				play_sound(sfx_laser2,1,false);
			}
		break;
		case 1:
			size = goto_value(size,size_max,0.5);
			if(state_time == active_time)
			{
				state = 2;
				mask_index = spr_nothing;
			}
		break;
		case 2:
			size = goto_value(size,0,0.5);
			if(size == 0)
			{
				instance_destroy(self);	
			}
		break;
	}
	


}

