/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s7_5",BOSS_REVERENCE,34575000)
spell_set_name("spell_s7_5","spell_s7_5","spell_s7_5","spell_s7_5")
spell_set_life(1200,260);
spell_set_time(60,false,90);

boss_movement_goto(room_width / 2, 130,7);

can_shield = true;

act_dir = 1;

obj_boss.y_disjoint = 120;
obj_boss.y_dis_max = 140;