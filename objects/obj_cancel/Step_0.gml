/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	alpha = goto_value(alpha,0,0.1)
	scale += recursiv(scale,0,10,0.01); // goto_value(scale,0,0.05)
	
	if(alpha == 0)
	{
		instance_destroy();
	}
}