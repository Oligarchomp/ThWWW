/// @description Insert description here
// You can write your code in this editor

with(obj_thunder)
{
	instance_destroy();	
}

obj_boss.state = 2;
with(obj_boss_info)
{
	instance_destroy()
}
// Inherit the parent event
event_inherited();

