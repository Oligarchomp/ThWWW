/// @description Insert description here
// You can write your code in this editor

with(obj_bubble_timeout)
{
	state = 1;
}

obj_boss.alpha = 1;
obj_boss.mask_index = spr_boss_hurtbox;
with(obj_shield_reverence)
{
	state = 1;	
}
// Inherit the parent event
event_inherited();

