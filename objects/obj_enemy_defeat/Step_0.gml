/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	
	alpha = goto_value(alpha,0,0.1)
	scale += 0.2;
	
	if(alpha == 0)
	{
		instance_destroy();
	}
	
	
}