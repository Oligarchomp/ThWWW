
if(global.gp_active)
{
	
	
	alpha = goto_value(alpha,0,0.1)
	scale = goto_value(scale,0,0.1)
	
	if(alpha == 0)
	{
		instance_destroy(self);
	}
	
	
	if(instance_exists(owner))
	{
		x = owner.x;
		y = owner.y;
	}
}