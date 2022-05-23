/// @description Insert description here
// You can write your code in this editor
obj_boss.y_disjoint = obj_boss.y_disjoint_ref;
obj_boss.y_dis_max = obj_boss.y_dis_max_ref;

boss_movement_goto(obj_boss.x + 8 * sign(room_width / 2 - obj_boss.y),obj_boss.y - 30,3)

obj_boss.alpha = 1;
obj_boss.mask_index = spr_boss_hurtbox;
with(obj_shield_reverence)
{
	state = 1;	
}

with(obj_item) // for the anchor point cancel item
{
	x = max(x,-30);
	x = min(x,room_width + 30);	
}

// Inherit the parent event
event_inherited();

