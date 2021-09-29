/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s4_2",BOSS_YUUTO,4521000)
spell_set_name("spell_s4_2a","spell_s4_2a","spell_s4_2b","spell_s4_2c")
spell_set_life(960,180);
spell_set_time(35,false,95);

y_pos_ref = 120;

boss_movement_goto(room_width / 2,y_pos_ref,5);

wave_dir = 1;

state = 2;