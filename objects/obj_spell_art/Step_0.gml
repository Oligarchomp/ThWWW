/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	y += spd;
	
	if (step < 60)
	{
		if (alpha < alpha_max)
		{
			alpha += 0.02;
		}
	}
	else
	{
		alpha -= 0.02;
		if (alpha <= 0)
		{
			instance_destroy(self);
		}
	}
	
	
	
	step += 1;
}