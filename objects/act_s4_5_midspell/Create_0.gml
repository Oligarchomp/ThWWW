/// @description Insert description here
// You can write your code in this editor
global.boss = BOSS_IKU;
// Inherit the parent event
event_inherited();

spell_set_spell("s4_mid",BOSS_IKU,24000000)
spell_set_name("spell_s4_mida","spell_s4_mida","spell_s4_midb","spell_s4_midb")
spell_set_life(800,230);
spell_set_time(24,false,160);


// to sync with the music
instance_create_depth(0,0,0,act_s4_6);