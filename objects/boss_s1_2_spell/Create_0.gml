/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


spell_set_spell("s1_1",1,10000000)
spell_set_name("spell_s1_1a","spell_s1_1a","spell_s1_1b","spell_s1_1c")
spell_set_life(760,200);
spell_set_time(23,false,95);

boss_movement_goto(room_width / 2, 100,7);

x_gey = 0;
y_gey = room_height;

gey_first = true;

gey_rice_angle = 90;

ring_angle = rng(360,true,3);