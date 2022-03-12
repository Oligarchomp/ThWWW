/// @description Insert description here
// You can write your code in this editor

global.stage = 5;
// Inherit the parent event
event_inherited();


global.boss = BOSS_FEZA;

bg_to_create = bg_s5;

if(global.game_type == GAME_SPELL)
{
	music = noone;//only feza
}
else
{
	music = mus_stage5;
}