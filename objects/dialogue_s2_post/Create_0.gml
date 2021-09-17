/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
need_clear_bonus = true;

switch(global.player_chosen)
{
	case P_REIMU:
		set_dialogue(spr_reimu_art,4,true,spr_nothing,0,false,get_text("diag_s2_r14"),-1);
		set_dialogue(spr_reimu_art,5,true,spr_nothing,0,false,get_text("diag_s2_r15"),-1);
		set_dialogue(spr_reimu_art,2,true,spr_nothing,0,false,get_text("diag_s2_r16"),-1);
	break;
	case P_MARISA:
		set_dialogue(spr_marisa_art,1,true,spr_nothing,0,false,get_text("diag_s2_m13"),-1)
	break;
	case P_SANAE:
		set_dialogue(spr_sanae_art,3,true,spr_nothing,0,false,get_text("diag_s2_s12"),-1);
	break;
	
}

