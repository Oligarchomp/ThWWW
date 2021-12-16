/// @description Insert description here
// You can write your code in this editor
if(step > step_lenght)
{
	
	rot += rot_plus;
	vsp += 0.25;
	
	xx += hsp;
	yy += vsp;
}



x = xx + lengthdir_x(dist,rot_ref + rot);
y = yy + lengthdir_y(dist,rot_ref + rot);

if(yy > 1000) or (obj_menu.level > 0)
{
	instance_destroy();	
}

step += 1;