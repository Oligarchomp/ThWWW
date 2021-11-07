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
	
	if(instance_exists(obj_boss))
	{
		x = obj_boss.x;
		y = obj_boss.y;
	}
	else
	{
		instance_destroy();	
	}
	
	switch(state)
	{
		case 0:
			scale_ref = goto_value(scale_ref,scale_max,0.1);
		break;
		case 1:
			scale_ref = goto_value(scale_ref,0,0.1);
			if(scale == 0)
			{
				instance_destroy();	
			}
		break;
	}
	
	scale = scale_ref + (sin(step / 20) * bop_scale) * scale_ref;
	
	step += 1;
}