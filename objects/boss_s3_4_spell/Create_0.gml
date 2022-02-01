/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s3_2",BOSS_PALE,20000000)
spell_set_name("spell_s3_2a","spell_s3_2a","spell_s3_2b","spell_s3_2b")
spell_set_life(1000,240);
spell_set_time(40,false,95);

boss_movement_goto(room_width / 2, 100,7);

angle_pale = 90;
dist_pale = 200;
dir_pale = 1;

x_ref = room_width / 2;
y_ref = room_height / 2 + 30;

angle_start = 90;

angle_charge = 90;

