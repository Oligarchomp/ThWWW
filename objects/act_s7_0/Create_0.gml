/// @description Insert description here
// You can write your code in this editor

global.stage = 7;

// Inherit the parent event
event_inherited();


global.boss = BOSS_REVERENCE;

bg_to_create = bg_s7;


if(global.game_type != GAME_SPELL)
{
	instance_create_depth(0,global.poc,0,obj_borderline);
	
	music = noone;
}
else
{
	music = noone;
	var ev = get_next_event();
	
	if(ev == act_s7_51_midspell) or (ev == act_s7_52_midspell) or (ev == act_s7_53_midspell)
	{
		music = noone;
	}
	
}

