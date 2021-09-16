/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	y += vsp;
	
	rot += rot_spd;
	
	if(y > room_width + 450)
	{
		instance_destroy();
	}
}