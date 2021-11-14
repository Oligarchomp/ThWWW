/// @description Insert description here
// You can write your code in this editor

/*
var dest = obj_boss.x + 30 * sign(room_width / 2 - obj_boss.x)
boss_movement_goto(dest, 100,sqrt(sqr(obj_boss.x - dest) + sqr(obj_boss.y - 100)) / 50);
*/
obj_boss.alpha = 1;
obj_boss.mask_index = spr_boss_hurtbox;
with(obj_shield_reverence)
{
	state = 1;	
}
// Inherit the parent event
event_inherited();

