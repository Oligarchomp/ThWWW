/// @description Insert description here
// You can write your code in this editor

global.boss = BOSS_DOVE;
// Inherit the parent event
event_inherited();
non_only = true;

spell_set_life(720,110);
spell_set_time(16,false,60)

dir_act = 1;

angle_shoot = rng(360,false,1);

item_nbr = item_nbr_spell;
need_cancel_bonus = true;