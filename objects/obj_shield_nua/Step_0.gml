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
			scale = goto_value(scale,0.5,scale_spd)
		break;
		case 1:
			scale = goto_value(scale,0,scale_spd)
			if(scale == 0)
			{
				instance_destroy();
			}
		break;
		
	}
	
	x = obj_boss.x;
	y = obj_boss.y;
	
	step += 1;
}