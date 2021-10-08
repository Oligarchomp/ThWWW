/// @description Insert description here
// You can write your code in this editor

global.boss = BOSS_DOVE;
// Inherit the parent event
event_inherited();

spell_set_life(790,100);
spell_set_time(26,false,90)

boss_movement_goto(room_width / 2, 100,6);

dir_act = 1;

x_aim = 0;
y_aim = 0;