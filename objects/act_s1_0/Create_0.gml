/// @description Insert description here
// You can write your code in this editor
event_inherited();
global.stage = 1;
global.boss = BOSS_APPLE;

bg_to_destroy = noone;
bg_to_create = bg_s1;
music = mus_stage1;

instance_create_depth(0,global.poc,0,obj_borderline);