/// @description Insert description here
// You can write your code in this editor
if (global.gp_active)
{
	x += lengthdir_x(spd,angle);
	y += lengthdir_y(spd,angle);
	
	if(state == 0)
	{
		scale += recursiv(scale,1,5,0.1)
		if (scale == 1)
		{
			state = 1;
		}
	}
	else
	{
		scale += recursiv(scale,0,5,0.1)
		if (scale == 0)
		{
			instance_destroy();
		}
	}
	
	
}