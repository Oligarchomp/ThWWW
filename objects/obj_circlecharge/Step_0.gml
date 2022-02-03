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
			alpha = goto_value(alpha,0.12,0.006);
			if(alpha == 0.12)
			{
				state += 1;	
			}
		break;
		case 1:
			if(state_time == 2)
			{
				state += 1;
			}
		break;
		case 2:
			alpha = goto_value(alpha,0,0.006);
			if(alpha == 0)
			{
				instance_destroy();
			}
		break;
	}
	
	
	
	
}