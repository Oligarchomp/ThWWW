/// @description Insert description here
// You can write your code in this editor
obj_boss.mask_index = spr_boss_hurtbox;
obj_boss.alpha = 1;
with(obj_shield_nua)
{
	state = 1;
}
// Inherit the parent event
event_inherited();

