/// @description Insert description here
// You can write your code in this editor

global.boss = BOSS_FEZA;
// Inherit the parent event
event_inherited();

spell_set_spell("s6_mid",BOSS_FEZA,30000000)
spell_set_name("spell_s6_mid","spell_s6_mid","spell_s6_mid","spell_s6_mid")

switch(global.player_chosen)
{
	case P_REIMU:
		var life = 160;
	break;
	case P_MARISA:
		var life = 165;
	break;
	case P_SANAE:
		var life = 232;
	break;
}
spell_set_life(life,100);
spell_set_time(20,false,95);

item_nbr = 0;

dir_act = -1;

boss_sp = 0;

boss_movement_goto(550,obj_boss.y - 50,boss_sp)