/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_life(920,240);
spell_set_time(40,false,90);

act_dir = 1;

angle_list = ds_list_create();
time_list = ds_list_create();
dir_list = ds_list_create();

angle_torpedo = rng(360,false,4);