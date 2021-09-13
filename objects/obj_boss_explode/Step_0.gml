if(global.gp_active)
{
	rot += rot_spd;
	
	x += lengthdir_x(spd,angle);
	y += lengthdir_y(spd,angle);
	
	alpha -= 0.01;
	if (alpha <= 0)
	{
		instance_destroy(self);
	}
	
	scale += 0.01;
}