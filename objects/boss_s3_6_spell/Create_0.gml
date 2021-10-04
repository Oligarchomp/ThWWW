/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s3_3",BOSS_PALE,12183560)
spell_set_name("spell_s3_3a","spell_s3_3a","spell_s3_3b","spell_s3_3b")
spell_set_life(1000,240);
spell_set_time(20,true,95);

boss_movement_goto(room_width / 2, 100,7);

angle_pale = 90;
dist_pale = 220;
dir_pale = -1;

x_ref = room_width / 2;
y_ref = room_height / 2;

angle_start = 90;

fan_angle = 90;
fan_spd = 0;
fan_accel = 0.005;

angle_bubble = 0;

item_nbr = 0;