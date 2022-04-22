/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s6_4",BOSS_NUA,30000000)
spell_set_name("spell_s6_4a","spell_s6_4a","spell_s6_4b","spell_s6_4b")
spell_set_life(2000,150);
spell_set_time(50,false,90);

boss_movement_goto(room_width / 2, 140,7);

obj_boss.y_disjoint = 125;
obj_boss.y_dis_max = 145;

act_dir = 1;

angle_charge = [];


mentos_angle_start = 0