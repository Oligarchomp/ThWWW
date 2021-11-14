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
			scale += recursiv(scale,scale_max,25,0.001);
		break;
		case 1:
			scale = goto_value(scale,0,0.1);
			if(scale == 0)
			{
				instance_destroy();	
			}
		break;
	}
	scale_true = scale + sin(step / 60) * 0.01 * scale;
	
	step += 1;
	
}