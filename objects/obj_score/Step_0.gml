/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	y += vsp;
	
	if(step > 30)
	{
		alpha = goto_value(alpha,0,0.1);
		if(alpha == 0)
		{
			instance_destroy();
		}
	}
	
	step += 1;
}