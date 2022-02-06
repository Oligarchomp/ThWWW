/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s7_6",BOSS_REVERENCE,45000000)
spell_set_name("spell_s7_6","spell_s7_6","spell_s7_6","spell_s7_6")
spell_set_life(10,200);
spell_set_time(60,false,90);

boss_movement_goto(room_width / 2, 100,7);

can_shield = true;

act_dir = 1;


