/// @description Insert description here
// You can write your code in this editor

global.boss = BOSS_PALE;
// Inherit the parent event
event_inherited();


spell_set_spell("s7_mid2",BOSS_PALE,40000000)
spell_set_name("spell_s7_mid2","spell_s7_mid2","spell_s7_mid2","spell_s7_mid2")
spell_set_life(980,190);
spell_set_time(20,false,120);

boss_movement_goto(room_width / 2,105,7);

angle_shoot = rng(360,false,6);

act_dir = -1;

aim_dir = 1;

first = true;