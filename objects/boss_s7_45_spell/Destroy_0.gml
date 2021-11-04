/// @description Insert description here
// You can write your code in this editor

if!(((state == 4) or (state == 0)) and (act_dir == -1))
{
	play_sound(sfx_spawn_light,1,false);
	obj_boss.alpha = 1;
	obj_boss.mask_index = spr_boss_hurtbox;

	obj_boss.x = room_width / 2 - 50 + rng(100,false,6);
	obj_boss.y = -300;
}

boss_movement_goto(room_width / 2,100,5.5);
with(obj_shield_reverence)
{
	state = 1;	
}
// Inherit the parent event
event_inherited();

