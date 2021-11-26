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
			scale = goto_value(scale,0,spd);
			if(scale == 0)
			{
				state = 1;
				room_goto(room_to);
			}
		break;
		case 1:
			if(state_time == 20)
			{
				state = 2;
			}
		break;
		case 2:
			scale = goto_value(scale,scale_max,spd);
			if(scale == scale_max)
			{
				instance_destroy();	
			}
		break;
	}
	
	
}