/// @description Insert description here
// You can write your code in this editor
if (global.gp_active)
{
	rot += rot_spd;
	
	x += lengthdir_x(2,angle);
	y += lengthdir_y(2,angle);
	
	alpha -= alpha_acc;
	
	if (alpha < 0)
	{
		instance_destroy(self);
	}
	
	scale += 0.08
	
}