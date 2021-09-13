/// @description Insert description here
// You can write your code in this editor
if (global.gp_active)
{
	scale -= 0.05
	alpha -= 0.01;
	
	x += lengthdir_x(spd,angle);
	y += lengthdir_y(spd,angle);
	
	if (scale < 0)
	{
		instance_destroy(self);
	}
	
}