/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s6_4",BOSS_NUA,34575000)
spell_set_name("spell_s6_4a","spell_s6_4a","spell_s6_4b","spell_s6_4b")
spell_set_life(1000,250);
spell_set_time(46,false,80);

boss_movement_goto(room_width / 2, 100,7);

act_dir = 1;

