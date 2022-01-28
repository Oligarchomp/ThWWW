/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


spell_set_spell("s1_mid",1,10000000)
spell_set_name("spell_s1_mida","spell_s1_mida","spell_s1_midb","spell_s1_midb")
spell_set_life(600,120);
spell_set_time(15,false,95);

obj_boss.x_disjoint = 40;
obj_boss.y_dis_max = 105;

boss_movement_goto(room_width / 2, 100,7);
