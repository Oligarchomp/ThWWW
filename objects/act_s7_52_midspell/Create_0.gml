/// @description Insert description here
// You can write your code in this editor

global.boss = BOSS_PALE;
// Inherit the parent event
event_inherited();


spell_set_spell("s7_mid2",BOSS_PALE,12014080)
spell_set_name("spell_s7_mid2","spell_s7_mid2","spell_s7_mid2","spell_s7_mid2")
spell_set_life(900,160);
spell_set_time(30,false,90);

boss_movement_goto(room_width / 2,100,7);

