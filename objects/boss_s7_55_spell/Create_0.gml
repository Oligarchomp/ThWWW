/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s7_5",BOSS_REVERENCE,34575000)
spell_set_name("spell_s7_5","spell_s7_5","spell_s7_5","spell_s7_5")
spell_set_life(700,200);
spell_set_time(60,false,95);

boss_movement_goto(room_width / 2, 100,7);


act_dir = 1;

can_shield = true;

