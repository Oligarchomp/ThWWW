/// @description Insert description here
// You can write your code in this editor

global.stage = 2;

event_inherited();

global.boss = BOSS_SERENE;

bg_to_create = bg_s2;

if(global.game_type == GAME_SPELL)
{
	music = get_next_event() == act_s2_6_midspell ? "stage2" : "boss2";
}
else
{
	music = "stage2";
}