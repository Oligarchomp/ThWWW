/// @description Insert description here
// You can write your code in this editor

image_speed = 0;
stage = global.stage;
alpha = 0;

time_to = 60;
spd = 0.5;


x = room_width / 2 - time_to * spd;
y = room_height / 2;

state = 0;
old_state = -1;
state_time = 0;

sprite_index = global.spr_stage_title;
