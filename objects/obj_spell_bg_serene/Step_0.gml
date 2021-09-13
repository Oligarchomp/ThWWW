/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(global.gp_active)
{
	y += vsp;
	y %= height * 2;
	
	x += hsp;
	x %= width;
	
}