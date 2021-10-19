/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s6_2",BOSS_NUA,34575000)
spell_set_name("spell_s6_2a","spell_s6_2a","spell_s6_2b","spell_s6_2c")
spell_set_life(1080,180);
spell_set_time(46,false,80);

boss_movement_goto(room_width / 2, 100,7);

act_dir = 1;

