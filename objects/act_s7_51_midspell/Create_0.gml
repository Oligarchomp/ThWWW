/// @description Insert description here
// You can write your code in this editor

global.boss = BOSS_PALE;
// Inherit the parent event
event_inherited();


spell_set_spell("s7_mid1",BOSS_PALE,12014080)
spell_set_name("spell_s7_mid1","spell_s7_mid1","spell_s7_mid1","spell_s7_mid1")
spell_set_life(1100,160);
spell_set_time(28,false,90);


act_dir = 1;

angle_fan = -90;