/// @description Insert description here
// You can write your code in this editor
if (global.gp_active)
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
	
	var wait = 120;
	switch(state)
	{
		case 0:
			alpha = goto_value(alpha,1,1 / time_to)
			if(alpha == 1)
			{
				state = 1;
			}
			x += spd;
		break;
		case 1:
			if (state_time == wait)
			{
				state = 2;
			}
		break;
		case 2:
			alpha = goto_value(alpha,0,1 / time_to)
			if(alpha == 0)
			{
				instance_destroy(self);
			}
			x += spd;
		break;
	}
}