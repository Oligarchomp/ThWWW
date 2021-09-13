/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	alpha = goto_value(alpha,0,0.05)
	scale += 0.1;
	
	
	
	part_scale = (0.5 + cos(step/ 6) * 0.2) * part_scale_size;
	part_dist += 3;
	
	part_scale_size = goto_value(part_scale_size,0,0.05);
	
	if (alpha == 0)
	{
		instance_destroy();
	}
	
	step += 1;
}