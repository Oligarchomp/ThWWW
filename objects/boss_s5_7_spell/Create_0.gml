/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s5_4",BOSS_FEZA,28000000)
spell_set_name("spell_s5_4a","spell_s5_4a","spell_s5_4b","spell_s5_4b")
spell_set_life(980,170);
spell_set_time(45,false,95);

boss_movement_goto(room_width / 2,100,6);

item_nbr = 0;

dir_act = 1;
