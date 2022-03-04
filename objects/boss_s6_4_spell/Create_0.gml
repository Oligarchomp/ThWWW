/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s6_2",BOSS_NUA,30000000)
spell_set_name("spell_s6_2a","spell_s6_2a","spell_s6_2b","spell_s6_2c")
spell_set_life(1400,160);
spell_set_time(50,false,74);

boss_movement_goto(room_width / 2, 100,7);

act_dir = 1;

