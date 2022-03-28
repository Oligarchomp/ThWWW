/// @description Insert description here
// You can write your code in this editor
obj_boss.state = 2;
with(obj_boss_info)
{
	instance_destroy()
}

with(obj_rain)
{
	instance_destroy();	
}

clear_charge();
// Inherit the parent event
event_inherited();

