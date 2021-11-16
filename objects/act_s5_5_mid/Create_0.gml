/// @description Insert description here
// You can write your code in this editor

global.boss = BOSS_DOVE;
// Inherit the parent event
event_inherited();
non_only = true;

spell_set_life(710,120);
spell_set_time(17,false,90)

boss_movement_goto(room_width / 2, 100,6);

dir_act = 1;

x_aim = noone;
y_aim = noone;

item_nbr = item_nbr_spell;

// to sync with the music
instance_create_depth(0,0,0,act_s5_7);