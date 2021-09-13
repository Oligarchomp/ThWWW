/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	x += lengthdir_x(spd,angle);
	y += lengthdir_y(spd,angle);
	
	alpha = goto_value(alpha,0,0.01);
	scale = goto_value(scale,0,0.01);
	
	if(scale == 0)
	{
		instance_destroy();
	}
	
	
	
}