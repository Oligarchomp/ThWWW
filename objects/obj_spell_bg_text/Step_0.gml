/// @description Insert description here
// You can write your code in this editor
if (global.gp_active)
{
	
	if (last_state != state)
	{
		last_state = state;
		state_time = 0;
	}
	else
	{
		state_time += 1;
	}
	
	switch(state)
	{
		case 0:
			alpha += recursiv(alpha,alpha_max,alpha_spd,0.05);
			if (alpha == alpha_max)
			{
				state = 1;
			}
		break;
		case 1:
			if (state_time == hold_frame)
			{
				state = 2;
			}
		break;
		case 2:
			alpha += recursiv(alpha,0,alpha_spd,0.05);
			if (alpha == 0)
			{
				instance_destroy();
			}
		break;
	}
	
	offset += spd;
	
}