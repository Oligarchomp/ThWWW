/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

act_set_time(600,600);

instance_create_depth(-80,50,global.boss_depth,obj_boss);
instance_destroy(obj_boss_indicator);

wave = 0;

angle_ball = 0;
