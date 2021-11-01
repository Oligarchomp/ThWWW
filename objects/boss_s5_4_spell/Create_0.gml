/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s5_2",BOSS_FEZA,26854750)
spell_set_name("spell_s5_2a","spell_s5_2a","spell_s5_2b","spell_s5_2c")
spell_set_life(970,170);
spell_set_time(38,false,95);

boss_movement_goto(room_width / 2,60,6);

dir_act = 1;


stab_angle = 0;