/// @description Insert description here
// You can write your code in this editor
global.stage = 1;

event_inherited();

global.boss = BOSS_APPLE;

bg_to_create = bg_s1;


if(global.game_type != GAME_SPELL)
{
	instance_create_depth(0,global.poc,0,obj_borderline);
	
	music = "stage1";
}
else
{
	music = get_next_event() == act_s1_6_midspell ? "stage1" : "boss1";
}