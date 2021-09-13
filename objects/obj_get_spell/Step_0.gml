/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	if(step < 120)
	{
		x_scale = goto_value(x_scale,1,0.08);
		rot += recursiv(rot,0,5,0.01);
		
		bonus_alpha = goto_value(bonus_alpha,1,0.1);
	}
	else
	{
		x_scale = goto_value(x_scale,0,0.08);
		rot = goto_value(rot,-360,6);
		
		bonus_alpha = goto_value(bonus_alpha,0,0.1);
		if(x_scale == 0)
		{
			instance_destroy();
		}
	}
	
	step += 1;
}