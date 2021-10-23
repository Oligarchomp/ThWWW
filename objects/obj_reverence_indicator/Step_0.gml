/// @description Insert description here
// You can write your code in this editor
if (global.gp_active)
{
	if(!instance_exists(owner))
	{
		instance_destroy(self);
		exit;
	}
	
	x = owner.x;
	y = owner.y;
	
	rot += rot_spd
	
	if (scale_min < scale_min_max)
	{
		scale_min += recursiv(scale_min,scale_min_max,10,0.01);
	}
	
	scale = dcos(step) / 8 + scale_min;
	step += 1;

}