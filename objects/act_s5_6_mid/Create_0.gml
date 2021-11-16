/// @description Insert description here
// You can write your code in this editor

global.boss = BOSS_DOVE;
// Inherit the parent event
event_inherited();
non_only = true;

spell_set_life(600,100);
spell_set_time(17,false,90)

dir_act = 1;

x_aim = 0;
y_aim = 0;

item_nbr = item_nbr_spell;
need_cancel_bonus = true;