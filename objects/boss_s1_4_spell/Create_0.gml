/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


spell_set_spell("s1_2",1,10000000);
spell_set_name("spell_s1_2a","spell_s1_2a","spell_s1_2b","spell_s1_2b");
spell_set_life(1000,200);
spell_set_time(23,false,95);

item_nbr = 0;

boss_movement_goto(room_width / 2, 120,6)


angle_arc = 90 - 20 + rng(40,false,1);

dir_act = 1;