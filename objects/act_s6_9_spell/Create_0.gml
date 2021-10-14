/// @description Insert description here
// You can write your code in this editor

global.boss = BOSS_FEZA;
// Inherit the parent event
event_inherited();

spell_set_spell("s6_mid",BOSS_FEZA,321400000)
spell_set_name("spell_s6_mid","spell_s6_mid","spell_s6_mid","spell_s6_mid")

switch(global.player_chosen)
{
	case P_REIMU:
		var life = 155;
	break;
	case P_MARISA:
		var life = 145;
	break;
	case P_SANAE:
		var life = 222;
	break;
}
spell_set_life(life,150);
spell_set_time(16,false,95);

item_nbr = 0;

dir_act = 1;

boss_sp = 0;