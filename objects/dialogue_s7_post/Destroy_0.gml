/// @description Insert description here
// You can write your code in this editor
with(obj_boss_info)
{
	instance_destroy()
}

obj_player.cant_shoot = true;

// Inherit the parent event
event_inherited();

