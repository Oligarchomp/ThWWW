/// @description Insert description here
// You can write your code in this editor
global.stage = 3;

// Inherit the parent event
event_inherited();


global.boss = BOSS_PALE;

bg_to_create = bg_s3;

if(global.game_type == GAME_SPELL)
{
	music = get_next_event() == act_s3_7_midspell ? mus_stage3 : mus_boss3;
}
else
{
	music = mus_stage3;
}