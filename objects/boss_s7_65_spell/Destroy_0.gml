/// @description Insert description here
// You can write your code in this editor

boss_movement_goto(room_width / 2,100,4.2);

obj_boss.alpha = 1;
obj_boss.mask_index = spr_boss_hurtbox;
with(obj_shield_reverence)
{
	state = 1;	
}
// Inherit the parent event
event_inherited();

