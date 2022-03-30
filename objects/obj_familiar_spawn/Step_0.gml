/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	alpha = goto_value(alpha,1,0.02)
	scale = goto_value(scale,0,0.1);
	
	if(scale == 0)
	{
		ready_spawn = true;	
		//failsafe
		if(step > 600)
		{
			instance_destroy();	
		}
	}
	
	step += 1;
	
	rot += 1.5;
}