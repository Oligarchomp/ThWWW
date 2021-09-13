/// @description Insert description here
// You can write your code in this editor
// here so the base shot can not go beyond them, and still go hit by the shot hitbox
if(global.gp_active)
{
	switch(pos_type)
	{
		case POS_ANGLE:
			hsp = lengthdir_x(spd,angle)
			vsp = lengthdir_y(spd,angle)
			
			x += hsp;
			y += vsp;
		break;
		case POS_SP:
			x += hsp;
			y += vsp;
		break;
		case POS_MANUAL:
		
		break;
		
	}
}