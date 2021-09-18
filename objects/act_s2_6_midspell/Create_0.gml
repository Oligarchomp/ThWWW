/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


spell_set_spell("s2_mid",BOSS_SERENE,2120000)
spell_set_name("spell_s2_mida","spell_s2_mida","spell_s2_midb","spell_s2_midb")
spell_set_life(600,160);
spell_set_time(14,false,95);


obj_boss.pos_type = POS_SP;

screen_clear(false,true);

instance_create_depth(obj_boss.x,obj_boss.y,obj_boss.depth + 1,obj_boss_indicator);

// to sync with the music
instance_create_depth(0,0,0,act_s2_7);