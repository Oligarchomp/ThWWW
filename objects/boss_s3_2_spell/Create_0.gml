/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s3_1",BOSS_PALE,20000000)
spell_set_name("spell_s3_1a","spell_s3_1a","spell_s3_1b","spell_s3_1b")
spell_set_life(1000,160);
spell_set_time(40,false,95);

boss_movement_goto(room_width / 2, 100,7);

angle_shoot = 0;
dir_shoot = 1;