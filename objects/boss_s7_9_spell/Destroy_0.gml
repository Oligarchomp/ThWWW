/// @description Insert description here
// You can write your code in this editor

with(obj_danmaku8)
{
	instance_destroy();	
}

with(obj_laser)
{
	instance_destroy();	
}

with(obj_bubble_timeout)
{
	state = 1;
}

obj_boss.x = room_width / 2 + 1;
obj_boss.y = -150;

obj_boss.mask_index = spr_boss_hurtbox;

boss_movement_goto(room_width / 2,100,4.5);

// Inherit the parent event
event_inherited();

