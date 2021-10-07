/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_life(820,180);
spell_set_time(26,false,90)

boss_movement_goto(room_width / 2, 100,6);

dir_act = 1;

spin_time = 0;
ring_time = 0;
close_time = 0;

spin_angle = rng(360,false,4);
close_angle = 0;
ring_angle = 0;
close_x_to = noone;
close_y_to = noone;

ring_x_to = noone;
ring_y_to = noone;

obj_boss.y_dis_max = 118;