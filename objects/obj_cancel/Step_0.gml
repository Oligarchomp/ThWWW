/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	alpha = goto_value(alpha,0,1 / 12)
	

	scale = goto_value(scale,0,scale_ref / 12);
	
	
	if(alpha == 0)
	{
		instance_destroy();
	}
}