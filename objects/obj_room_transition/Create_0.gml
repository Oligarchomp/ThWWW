/// @description Insert description here
// You can write your code in this editor
depth = global.boss_depth + 10;

alpha = 1;

state = 0;
old_state = -1;

state_time = 0;

music = noone;

bg_to_create = noone;

bgm_name = "No name"

if(global.play_type == PLAY_MANUAL)
{
	unlock_stage(global.stage);
}