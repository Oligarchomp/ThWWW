/// @description Insert description here
// You can write your code in this editor
obj_boss.state = 2;
with(obj_shield_nua)
{
	state = 1;
}
//clear sky

/*
with(obj_backdrop)
{
	switch(im)
	{
		case 0:
		case 1:
			off_im = 4;
		break;
		case 3:
			off_im = 3;
		break;
		case 2:
			instance_destroy();
		break;
	}
}
*/


// Inherit the parent event
event_inherited();

with(obj_rain)
{
	instance_destroy();
}