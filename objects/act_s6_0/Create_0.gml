/// @description Insert description here
// You can write your code in this editor
global.stage = 6;

// Inherit the parent event
event_inherited();


global.boss = BOSS_NUA;

bg_to_create = bg_s6;

if(global.game_type == GAME_SPELL)
{
	music = get_next_event() == act_s6_5_spell ? noone : mus_boss6;
}
else
{
	music = noone;
}