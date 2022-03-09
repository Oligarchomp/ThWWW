/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

spell_set_spell("s6_3",BOSS_NUA,30000000)
spell_set_name("spell_s6_3a","spell_s6_3a","spell_s6_3b","spell_s6_3c")
spell_set_life(1600,260);
spell_set_time(50,false,95);

boss_movement_goto(room_width / 2, 100,7);

wave_off = 1;
