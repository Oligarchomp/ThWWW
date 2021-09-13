/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	x += lengthdir_x(spd,angle);
	y += lengthdir_y(spd,angle);
	
	if( y < -offscreen)
	{
		instance_destroy();
	}
	
}