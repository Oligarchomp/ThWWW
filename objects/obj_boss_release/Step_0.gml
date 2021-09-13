/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	
	alpha += recursiv(alpha,0,10,0.01)
	scale += 0.08;
	
	if(alpha == 0)
	{
		instance_destroy();
	}
	
	
}