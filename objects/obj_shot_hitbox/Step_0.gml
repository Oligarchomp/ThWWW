/// @description Insert description here
// You can write your code in this 
if(global.gp_active)
{
	life -= 1;
	
	if(life == 0)
	{
		instance_destroy();
	}
	
	

}