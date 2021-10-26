/// @description Insert description here
// You can write your code in this editor

obj_boss.alpha = 1;
obj_boss.mask_index = spr_boss_hurtbox;
with(obj_shield_reverence)
{
	state = 1;	
}

with(obj_laser)
{
	instance_destroy();	
}

boss_movement_goto(obj_boss.x + sign(room_width / 2 - obj_boss.x) * 10,100,5);
// Inherit the parent event
event_inherited();

