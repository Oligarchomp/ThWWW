/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s4_2",BOSS_YUUTO,5400000)
spell_set_name("spell_s4_2a","spell_s4_2a","spell_s4_2b","spell_s4_2b")
spell_set_life(950,190);
spell_set_time(30,false,95);

boss_movement_goto(room_width / 2, 100,6);
