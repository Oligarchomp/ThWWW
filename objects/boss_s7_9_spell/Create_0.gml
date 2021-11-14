/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s7_9",BOSS_REVERENCE,34575000)
spell_set_name("spell_s7_9","spell_s7_9","spell_s7_9","spell_s7_9")
spell_set_life(1000,200);
spell_set_time(60,true,90);

boss_movement_goto(room_width / 2, 100,7);

can_shield = true;

act_dir = 1;

wave_nbr = 0;
wave_wait = 46;


