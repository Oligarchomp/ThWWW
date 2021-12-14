/// @description Insert description here
// You can write your code in this editor

obj_boss.alpha = 1;
obj_boss.mask_index = spr_boss_hurtbox;
with(obj_shield_reverence)
{
	state = 1;	
}

with(obj_enemy)
{
	x += sign(room_width / 2 - x) * 20;
}

// Inherit the parent event
event_inherited();

