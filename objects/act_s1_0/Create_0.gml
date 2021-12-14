/// @description Insert description here
// You can write your code in this editor
global.stage = 1;

event_inherited();

global.boss = BOSS_APPLE;

bg_to_create = bg_s1;
music = mus_stage1;

if(global.game_type != GAME_SPELL)
{
	instance_create_depth(0,global.poc,0,obj_borderline);
}