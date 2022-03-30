/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s4_4m",BOSS_YUUTO,24000000)
spell_set_name("spell_s4_4m","spell_s4_4m","spell_s4_4m","spell_s4_4m")
spell_set_life(1300,300);
spell_set_time(45,false,100);

boss_movement_goto(300,80,5);

item_nbr = 0;

aim_dir = 0;
charge_dist = 0;

ring_angle = 0;


wave_dir = 1;
