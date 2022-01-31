/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s7_10",BOSS_REVERENCE,45000000)
spell_set_name("spell_s7_10","spell_s7_10","spell_s7_10","spell_s7_10")
spell_set_life(4100,250);
spell_set_time(90,false,60);

boss_movement_goto(room_width / 2, 130,7);

can_shield = true;

act_dir = 1;

farewell = 1;

wave1_aim = 90;
wave2_aim = 0;

wave = 1;

item_nbr = 0;

note_dir = 1;

timeout = false;