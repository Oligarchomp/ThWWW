/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s4_1",BOSS_YUUTO,24000000)
spell_set_name("spell_s4_1a","spell_s4_1a","spell_s4_1b","spell_s4_1b")
spell_set_life(880,170);
spell_set_time(30,false,95);

boss_movement_goto(room_width / 2, 100,6);

obj_boss.y_dis_max = 110;
obj_boss.x_disjoint = 100; 