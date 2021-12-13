/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s3_mid",BOSS_PALE,20000000)
spell_set_name("spell_s3_mida","spell_s3_mida","spell_s3_midb","spell_s3_midb")
spell_set_life(700,170);
spell_set_time(18.5,false,90);

with(obj_boss)
{
	instance_create_depth(x,y,depth + 1, obj_boss_indicator);
}





// to sync with the music
if(global.game_type != GAME_SPELL)
{
	instance_create_depth(0,0,0,act_s3_8);
}