/// @description Insert description here
// You can write your code in this editor

if (global.pause_pressed)
{
	global.gp_active = !global.gp_active
}

if(global.gp_active)
{
	global.time += 1;
}