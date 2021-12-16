/// @description Insert description here
// You can write your code in this editor


if(fall)
{
	vsp += 0.1;
	rot += rot_spd;
}
else
{
	step += 1;
}

if(y > 700)
{
	instance_destroy();	
}

x += hsp;
y += vsp;