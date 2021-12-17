/// @description Insert description here
// You can write your code in this editor

global.stage = 4;

// Inherit the parent event
event_inherited();


global.boss = BOSS_YUUTO;

bg_to_create = bg_s4;

if(global.game_type == GAME_SPELL)
{
	music = get_next_event() == act_s4_5_midspell ? noone : noone;
}
else
{
	music = noone;
}