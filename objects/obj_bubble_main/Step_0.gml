/// @description Insert description here
// You can write your code in this editor


x += hsp;
y += vsp;

scale = scale_ref + sin(step / 100) * 0.1;

if(y < -100)
{
	instance_destroy();
}

step += 1;