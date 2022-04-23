/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_life(500,100);
spell_set_time(15,false,100)


obj_boss.x = -100;
obj_boss.y = -100;


x_ref = 90;
y_ref = 100;

boss_movement_goto(x_ref,y_ref,6);

shoot_ref_time = 0;
shoot_ref_time2 = 0;
angle_ref = 0;

last_boss_in_position = false;

screen_clean(false,false);

// to sync with the music
instance_create_depth(0,0,0,act_s1_7);