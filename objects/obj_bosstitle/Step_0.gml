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
	
	if(!instance_exists(obj_dialogue))
	{
		state = 2;
	}
	
	
	switch(state)
	{
		case 0://here it comes!
			alpha = goto_value(alpha,1, 0.05);
			angle += recursiv(angle,0,10,0.01);
			if (angle == 0)
			{
				state = 1;
			}
		break;
		case 1://here it waits!
			if (state_time == 160)
			{
				state = 2;
			}
		break;
		case 2://here it leaves!
			alpha = goto_value(alpha,0, 0.05);
			angle += recursiv(angle,0,10,0.01);
			x += 1;
			if(alpha == 0)
			{
				instance_destroy();
			}
		
		break;
	}
	
	
}